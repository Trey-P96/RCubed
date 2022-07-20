
import 'package:flutter/material.dart';

class MyTheme{
  static const Color primary = const Color(0xFF43729E);
  static const Color secondary = const Color(0xFFFFFFFF);
  static const double offset = 800;
  static List<Widget> testing = [Container(
    color: Colors.blue,
    height: 500,
    child: Text("TEST2"),
  ),
    Container(
      color: Colors.red,
      height: 500,
    ),
    Container(
      color: Colors.orange,
      height: 500,
    ),];
  static List<Widget> boxes = [
    Container(
      height: 800,
      color: Colors.blue,
    ),
    Container(
      height: 800,
      color: Colors.red,
    ),
    Container(
      height: 800,
      color: Colors.blue,
    )
  ];
}