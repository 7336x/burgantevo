import 'package:burgantevo/pages/homepage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BurganTevoApp());
}

class BurganTevoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burgan Tevo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
