import 'package:flutter/material.dart';
import 'package:index/common/global.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  _changeTheme() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> themeWidgets = [
      const Text("AppBar=>Banner",
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
      Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Expanded(
              child: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: "请输入图片地址",
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              icon: const Icon(Icons.games_rounded),
              onPressed: _changeTheme,
              label: const Text('设置',
                  style: TextStyle(fontSize: 12.0, color: Colors.black)),
            ),
          ),
        ],
      ),
    ];
    for (var i = 0; i < 18; i++) {
      themeWidgets.add(
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () => _changeTheme(),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.primaries[i],
                    foregroundColor: Colors.white,
                    radius: 15.0,
                  ),
                  Text(
                    ' ${primariesName[i]}',
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          stretch: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: SizedBox(
              child: Image.asset(
                'assets/sagiri.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Theme'),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
          ),
          forceElevated: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(themeWidgets),
        ),
      ],
    );
  }
}
