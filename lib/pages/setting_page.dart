import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3.0,
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          )),
    );
  }
}

class _SettingPageState extends State<SettingPage> {
  void _download() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(150.0), // here the desired height
            child: AppBar(
              flexibleSpace: SizedBox(
                height: double.maxFinite,
                width: double.infinity,
                child: Image.asset(
                  'assets/sagiri.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text('Settings'),
            )),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
            SettingItem(title: 'download', onTap: _download),
          ],
        ));
  }
}
