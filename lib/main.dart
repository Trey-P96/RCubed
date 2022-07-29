import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/device_listener/device_listener.dart';
import 'package:rcubed/widgets/nav_bar/nav_bar.dart';

void main() {
  // flutter build web --web-renderer canvaskit --release // faster performance
  //flutter build web --release --web-renderer canvaskit --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false // compatible for android
  // Channel master, 3.1.0-0.0.pre.1129 // Dart version 2.18.0

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>DeviceProvider()),
          ChangeNotifierProvider(create: (_)=>PrimaryScrollProvider()),
    ],
    child: MyApp()),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // git test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      scrollBehavior: MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'R-Cubed Consulting',
      theme: ThemeData(
        scaffoldBackgroundColor: RCubedTheme.secondary,
        fontFamily: 'KumbhSans',
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeDelta: 2,
          fontSizeFactor: 1.1
        )
      ),
      home: SafeArea(
        child: DeviceListener(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 10,
              title: NavBar(),
              titleSpacing: 0,
            ),
            body: Home()),
        ),
      ),

    );
  }
}