import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:index/common/global.dart';
import 'package:index/pages/image_guide.dart';

class SiteCard extends Card {
  const SiteCard({
    super.key,
    required this.title,
    required this.imageURL,
    required this.mainURL,
    required this.pageNum,
  });

  final String title;
  final String imageURL;
  final String mainURL;
  final int pageNum;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(imageURL),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ImageGuide(
                mainURL: mainURL,
                pageNumofSite: pageNumPerSite[pageNum],
                siteParseMethod: siteParseMethod[pageNum],
                siteHomeTitle: title,
              );
            },
          ),
        );
      },
    ));
  }
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key, this.isEro = false});
  final bool isEro;

  @override
  Widget build(BuildContext context) {
    List<Widget> siteCards = isEro
        ? List<Widget>.generate(siteListEro.length, (i) {
            return SiteCard(
              title: siteListEro[i][0],
              imageURL: siteListEro[i][1],
              mainURL: siteListEro[i][2],
              pageNum: siteListEro[i][3],
            );
          })
        : List<Widget>.generate(siteListUnEro.length, (i) {
            return SiteCard(
              title: siteListUnEro[i][0],
              imageURL: siteListUnEro[i][1],
              mainURL: siteListUnEro[i][2],
              pageNum: siteListUnEro[i][3],
            );
          });

    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationPage'),
      ),
      // create 2 rows of cards that will be used to navigate to the other pages
      body: GridView.count(
        childAspectRatio: 3 / 1,
        crossAxisCount: 2,
        children: siteCards,
        // children: const [
        //   // call a widgt builder to create the cards

        //   SiteCard(
        //     title: 'Gennji 非・微エロ画像',
        //     imageURL: 'https://icons.feedercdn.com/gennji.com',
        //     mainURL:
        //         'https://gennji.com/category/%e3%80%90-%e9%9d%9e%e3%83%bb%e5%be%ae%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
        //     pageNum: 1,
        //   ),
        //   SiteCard(
        //     title: 'Moeimg 非・微エロ画像',
        //     imageURL: 'https://icons.feedercdn.com/moeimg.net',
        //     mainURL:
        //         'https://moeimg.net/category/%E9%9D%9E%E3%82%A8%E3%83%AD%E3%83%BB%E5%BE%AE%E3%82%A8%E3%83%AD%E7%94%BB%E5%83%8F',
        //     pageNum: 0,
        //   ),
        //   SiteCard(
        //     title: 'Moeimg エロ画像',
        //     imageURL: 'https://icons.feedercdn.com/moeimg.net',
        //     mainURL:
        //         'https://moeimg.net/category/%E3%82%A8%E3%83%AD%E7%94%BB%E5%83%8F',
        //     pageNum: 0,
        //   ),
        //   SiteCard(
        //     title: 'Gennji エロ画像',
        //     imageURL: 'https://icons.feedercdn.com/gennji.com',
        //     mainURL:
        //         'https://gennji.com/category/%e3%80%90-%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
        //     pageNum: 1,
        //   ),
        //   SiteCard(
        //     title: 'Gennji キャラ',
        //     imageURL: 'https://icons.feedercdn.com/gennji.com',
        //     mainURL:
        //         'https://gennji.com/category/%e3%80%90-%e3%82%ad%e3%83%a3%e3%83%a9%e7%94%bb%e5%83%8f-%e3%80%91/',
        //     pageNum: 1,
        //   ),
        //   SiteCard(
        //     title: '今夜のシチュエロ画像',
        //     imageURL: 'https://icons.feedercdn.com/situero.com',
        //     mainURL: 'https://situero.com/',
        //     pageNum: 2,
        //   ),
        // ],
      ),
    );
  }
}
