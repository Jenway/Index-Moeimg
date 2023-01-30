import 'package:flutter/material.dart';
import 'package:index/pages/navigation.dart';
import 'package:index/pages/image_guide.dart';
import 'pic_page.dart';
import 'about_page.dart';
import 'setting_page.dart';
import 'theme_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const SettingPage();
        },
      ),
    );
  }

  void _showAboutPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const Scaffold(
            body: AboutPage(),
          );
        },
      ),
    );
  }

  void _showThemePage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const Scaffold(
            body: ThemePage(),
          );
        },
      ),
    );
  }

  void _showDowmload() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final List<String> picAddress = [
            'https://gennji.com/wp-content/uploads/2023/01/ad2d5eace0a0eca4787dc4bd544bd1eb.jpg',
            'https://nijifeti.com/wp-content/uploads/2021/09/uwagitakushi-083-22.jpg',
            'https://situero.com/wp-content/uploads/2023/01/02515032912202217.jpg',
            // 'https://img.favsite.jp/image/rank/10370638.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18534/2_rnx6rm4vs1.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/1_nuk5yvaxm5.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/2_hd2t0910n8.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/3_h6xhsiqj62.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/4_msckgvy0a9.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/5_c7c3ou0irp.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/7_mc6eiajqrs.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/8_zxm0jsgxsi.jpg',
            'https://img.moeimg.net/wp-content/uploads/archives18/18558/11_4bv55ylvit.jpg'
          ];
          return PicPage(
            picAddress: picAddress,
            picSource: 'Moeimg',
          );
        },
      ),
    );
  }

  void _sailToMoeIMG() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const ImageGuide(
            mainURL:
                'https://moeimg.net/category/%E9%9D%9E%E3%82%A8%E3%83%AD%E3%83%BB%E5%BE%AE%E3%82%A8%E3%83%AD%E7%94%BB%E5%83%8F',
            pageNumofSite: 10,
            siteParseMethod: 0,
            siteHomeTitle: 'Moeimg 非・微エロ画像',
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(widget.title),
        actions: <Widget>[
          // 返回顶部
          const IconButton(
              onPressed: null, icon: Icon(Icons.arrow_upward_outlined)),
          // 更改列数
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.view_column_outlined)),
          // 下载管理
          IconButton(
              onPressed: _showDowmload,
              icon: const Icon(Icons.file_download_outlined)),
        ],
      ),
      body: const ImageGuide(
        mainURL:
            'https://gennji.com/category/%e3%80%90-%e9%9d%9e%e3%83%bb%e5%be%ae%e3%82%a8%e3%83%ad%e7%94%bb%e5%83%8f-%e3%80%91/',
        pageNumofSite: 20,
        siteParseMethod: 1,
        siteHomeTitle: 'Gennji 非・微エロ画像',
        isAppbar: false,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/appBar.png'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  "Index!",
                  style: TextStyle(color: Colors.white, fontSize: 50.0),
                ),
              ),
            ),
            const ListTile(
              title: Text('少女祈祷中~'),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: false,
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.sailing),
                    title: const Text('Sailing'),
                    onTap: () {
                      Navigator.pop(context);
                      _sailToMoeIMG();
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('ILLUSTRATION'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const Scaffold(
                              body: NavigationPage(
                                isEro: false,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.no_adult_content_outlined),
                    title: const Text('Ero 18+'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return const Scaffold(
                              body: NavigationPage(
                                isEro: true,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.cell_tower_sharp),
                    title: const Text('COSPLAY'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('PHOTOGRAPHY'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.piano_outlined),
              title: const Text('Theme'),
              onTap: () {
                Navigator.pop(context);
                _showThemePage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settinhs'),
              onTap: () {
                Navigator.pop(context);
                _showSettings();
              },
            ),
            ListTile(
              leading: const Icon(Icons.battery_charging_full_outlined),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                _showAboutPage();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
