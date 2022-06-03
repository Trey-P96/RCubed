import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // git test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CupertinoScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'R-Cubed Consulting',
      theme: ThemeData(
        scaffoldBackgroundColor: MyTheme().secondary,
      ),
      home: Scaffold(
        body: HomePage(),
      ),

    );
  }
}
