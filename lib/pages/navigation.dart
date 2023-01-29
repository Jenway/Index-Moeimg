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
      body: ListView(
        children: [
          Card(
            child: ListTile(
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
          Card(
            child: ListTile(
              title: const Text('Gennji'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ImageGuide(
                        mainURL:
                            'https://gennji.com/category/%e3%80%90-%e9%9d%9e%e3%83%bb%e5%be%ae%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
                        pageNumofSite: pageNumPerSite[1],
                        siteParseMethod: siteParseMethod[1],
                        siteHomeTitle: 'Gennji',
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Future Build Route'),
              onTap: () {
                Navigator.of(context).pushNamed('/future_build_route');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('About Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/about_page');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Setting Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/setting_page');
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Theme Page'),
              onTap: () {
                Navigator.of(context).pushNamed('/theme_page');
              },
            ),
          ),
        ],
      ),
    );
  }
}
