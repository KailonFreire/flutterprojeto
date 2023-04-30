import 'package:flutter/material.dart';
import 'Login.dart';
import 'registrar.dart';
 void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '9 Store',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Register(),
    );
  }
}