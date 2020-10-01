import 'package:flutter/material.dart';
import 'package:lesson2creative/screens/carddemo_screen.dart';
import 'package:lesson2creative/screens/gridviewdemo_screen.dart';
import 'package:lesson2creative/screens/startscreen.dart';

void main() {
  runApp(Lesson2CreativeApp());
}

class Lesson2CreativeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[800],
        fontFamily: 'Monospace',
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        CardDemoScreen.routeName: (context) => CardDemoScreen(),
        GridViewDemoScreen.routeName: (context) => GridViewDemoScreen(),
      },
    );
  }

}