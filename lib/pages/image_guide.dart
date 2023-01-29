import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:html/parser.dart' show parse;
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

import 'pic_page.dart';
import 'package:index/network/parse_method.dart';
import 'package:index/widgets/site_container.dart';

// how this page works:
// 1. with the main url, we can get the image page's home page
// 2. with the home page, we can get different image pages' urls
// 3. with the image page's url, we can get pic addresses and build the pic page

// let's name the functions
// through the extend navigation page ,we enter into ImageGuide page with a mainURL
// with mainUrl we choose separate parse method to get pages of that website
// every page is displayed as a card
// as clicked we get that page's image address and commit to picPage

// guidePage => display the site's several pages
// parseSite => get pages lists
// parsePage => get image lists

class ImageGuide extends StatefulWidget {
  const ImageGuide(
      {Key? key,
      required this.mainURL,
      required this.pageNumofSite,
      required this.siteParseMethod,
      required this.siteHomeTitle})
      : super(key: key);
  // the main url of the website
  final String mainURL;
  final int pageNumofSite;
  final int siteParseMethod;
  final String siteHomeTitle;
  @override
  State<ImageGuide> createState() => _ImageGuideState();
}

class _ImageGuideState extends State<ImageGuide> {
  Dio dio = Dio();
  // this function is used to display the image page
  void _sailToPage({required String picAddress, required String picSource}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            body: FutureBuilder(
              future: _getPage(url: picAddress),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return PicPage(
                    picAddress: snapshot.data,
                    picSource: picSource,
                  );
                } else {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('加载中'),
                    ),
                    body: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  // download html as string
  Future<List<Widget>> _getSite() async {
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: widget.mainURL)).interceptor);
    final response = await dio.get(
      widget.mainURL,
      options: Options(
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',
        },
      ),
    );
    var document = parse(response.data).documentElement!;
    var html = HtmlXPath.node(document);
    return getSitePages(html);
  }

  List<Widget> getSitePages(HtmlXPath html) {
    var albumList = List<Widget>.generate(widget.pageNumofSite, (i) {
      String src = SiteParse.src[widget.siteParseMethod](html, i);
      String href = SiteParse.href[widget.siteParseMethod](html, i);
      String title =
          SiteParse.title[widget.siteParseMethod](html, i).toString();

      return Card(
        child: InkWell(
          onTap: () {
            _sailToPage(picAddress: href, picSource: title);
          },
          child: SiteContainer(title: title, src: src),
        ),
      );
    });

    return albumList;
  }

  Future<List<String>> _getPage({
    required String url,
  }) async {
    dio.interceptors
        .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',
        },
      ),
    );
    final document = parse(response.data).documentElement!;
    final html = HtmlXPath.node(document);
    return PageParse.page[widget.siteParseMethod](html: html);
  }

  @override
  Widget build(BuildContext context) {
    var albumList = _getSite();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.siteHomeTitle),
      ),
      body: FutureBuilder(
        future: albumList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                children: snapshot.data as List<Widget>,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
