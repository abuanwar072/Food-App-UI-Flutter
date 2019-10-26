import 'package:flutter/material.dart';
import 'package:food_app_ui_flutter/conststant.dart';
import 'package:food_app_ui_flutter/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: kMainColor,
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
