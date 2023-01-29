import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // show avatar and name with background image

        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(150.0), // here the desired height
            child: AppBar(
              // leading show avatar
              flexibleSpace: Container(
                //add background image
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sagiri.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: double.maxFinite,
                width: double.infinity,
                child: Column(
                  children: const <Widget>[
                    Padding(padding: EdgeInsets.all(10.0)),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "      Jenway \n & Sagiri Izumi",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Image.asset(
                //   'assets/sagiri.jpeg',
                //   fit: BoxFit.cover,
                // ),
              ),
            )),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            const ListTile(
              title: Text("hello"),
              dense: true,
              minVerticalPadding: 0.0,
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
            ),
            Row(
              children: const <Widget>[
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "请输入图片地址",
                  ),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('设置'),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
