 import 'package:flutter/material.dart';
import 'package:go_moon/pages/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoMoon',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      home: HomePage(),
    );
  }
} 