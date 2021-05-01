import 'package:flutter/material.dart';
import 'package:todo_web/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Web Applications',
      home: MyHomePage(),
    );
  }
}