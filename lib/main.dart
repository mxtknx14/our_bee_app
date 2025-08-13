import 'package:flutter/material.dart';
import 'intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Bee Went Back to the Flower Again',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: 'GaramondBook',
        brightness: Brightness.dark,
      ),
      home: const IntroPage(),
    );
  }
}
