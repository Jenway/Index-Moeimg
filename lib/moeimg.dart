import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:index/pages/pic_page.dart';
import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';
import 'package:dio/dio.dart';

class MoeImg extends StatefulWidget {
  const MoeImg({super.key});
  final url = "https://moeimg.net/18558.html";
  final picSource = 'Moeimg';
  @override
  State<MoeImg> createState() => _MoeImgState();
}

class _MoeImgState extends State<MoeImg> {
  List<String> picAddress = [
    'https://gennji.com/wp-content/uploads/2023/01/ad2d5eace0a0eca4787dc4bd544bd1eb.jpg',
  ];
  Dio dio = Dio();
  Future<void> _getPage() async {
    picAddress.clear();
    String text = 'test';
    try {
      Response response;
      response = await dio.get(widget.url);
      text = response.toString();
    } catch (e) {
      text = "请求失败：$e";
    }

    final document = parse(text).documentElement!;
    final html = HtmlXPath.node(document);
    String postSingle =
        document.getElementsByClassName("post-single")[0].innerHtml;
    var rawAddress = parse(postSingle).getElementsByClassName("box");
    picAddress.add(
        html.query('//*[@id="main-2"]/div[2]/div/div[2]/a/@href').attrs[0]!);

    for (var i = 2; i < rawAddress.length; i++) {
      picAddress.add(html
          .query('//*[@id="main-2"]/div[2]/div/div[${i + 7}]/a/@href')
          .attrs[0]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getPage();
    return PicPage(
      picAddress: picAddress,
      picSource: widget.picSource,
    );
  }
}
