import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:index/common/global.dart';
import 'package:index/pages/image_guide.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationPage'),
      ),
      // create 2 rows of cards that will be used to navigate to the other pages
      body: GridView.count(
        childAspectRatio: 3 / 1,
        crossAxisCount: 2,
        children: [
          Card(
            //https://icons.feedercdn.com/moeimg.net
            // https://img.moeimg.net/wp-content/uploads/img/moeimg_pc_2.gif
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/moeimg.net'),
              ),
              title: const Text('Moeimg 非・微エロ画像'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://moeimg.net/category/%E9%9D%9E%E3%82%A8%E3%83%AD%E3%83%BB%E5%BE%AE%E3%82%A8%E3%83%AD%E7%94%BB%E5%83%8F',
                        pageNumofSite: pageNumPerSite[0],
                        siteParseMethod: siteParseMethod[0],
                        siteHomeTitle: 'Moeimg 非・微エロ画像',
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Moeimg エロ画像'),
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/moeimg.net'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://moeimg.net/category/%E3%82%A8%E3%83%AD%E7%94%BB%E5%83%8F',
                        pageNumofSite: pageNumPerSite[0],
                       
                        siteParseMethod: siteParseMethod[0],
                        siteHomeTitle: 'Moeimg エロ画像',
                      );
                    },
                  ),
                );
              },
            ),
          ),
          //https://icons.feedercdn.com/gennji.com
          Card(
            child: ListTile(
              title: const Text('Gennji 非・微エロ画像'),
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/gennji.com'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://gennji.com/category/%e3%80%90-%e9%9d%9e%e3%83%bb%e5%be%ae%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
                        pageNumofSite: pageNumPerSite[1],
                        
                        siteParseMethod: siteParseMethod[1],
                        siteHomeTitle: 'Gennji 非・微エロ画像',
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Gennji エロ画像'),
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/gennji.com'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://gennji.com/category/%e3%80%90-%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
                        pageNumofSite: pageNumPerSite[1],

                        siteParseMethod: siteParseMethod[1],
                        siteHomeTitle: 'Gennji エロ画像',
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Gennji キャラ'),
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/gennji.com'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://gennji.com/category/%e3%80%90-%e3%82%ad%e3%83%a3%e3%83%a9%e7%94%bb%e5%83%8f-%e3%80%91/',
                        pageNumofSite: pageNumPerSite[1],
                        siteParseMethod: siteParseMethod[1],
                        siteHomeTitle: 'Gennji キャラ',
                      );
                    },
                  ),
                );
              },
            ),
          ),
                    Card(
            child: ListTile(
              title: const Text('Gennji キャラ'),
              leading: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                    'https://icons.feedercdn.com/gennji.com'),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://situero.com/',
                        pageNumofSite: pageNumPerSite[2],
                        siteParseMethod: siteParseMethod[2],
                        siteHomeTitle: '今夜のシチュエロ画像',
                      );
                    },
                  ),
                );
              },
            ),
          ),


        ],
      ),
    );
  }
}
