import 'package:flutter/material.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Color bakColor = const Color.fromARGB(255, 72, 123, 180);
    Brightness brightness = Brightness.light;
    String title = 'Index!';
    // ignore: unused_element
    changeTheme(
        Color givenColor, Brightness givenBrightness, String givenString) {
      setState(() {
        bakColor = givenColor;
        brightness = givenBrightness;
        title = givenString;
      });
    }

    return MaterialApp(
      title: 'Index! moeImg ԅ(¯﹃¯ԅ)',
      theme: ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: bakColor), bottomAppBarTheme: BottomAppBarTheme(color: bakColor),
      ),
      // darkTheme: ThemeData.dark(),
      home: HomePage(
        title: title,
      ),
    );
  }
}
