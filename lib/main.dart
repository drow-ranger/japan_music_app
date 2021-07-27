import 'package:flutter/material.dart';
import 'package:japan_music_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japan Music',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}