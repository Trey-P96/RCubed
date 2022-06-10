import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import '../../themes/theme.dart';
import '../../widgets/adaptive_scroll.dart';
import '../../widgets/backgroundImage.dart';
import '../../widgets/navigation_bar/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const Background(),
        Column(
          children: [
            NavBar(),
            AdaptiveScroll(
              [
                ScrollItem(topPadding: 60, height: 150, child: Logo()),
                ScrollItem(
                    topPadding: 30,
                    height: 30,
                    child: Text("R-CUBED CONSULTING")),
                ScrollItem(
                    height: 0.5,
                    child: Container(
                      color: Colors.black,
                      width: 1000,
                      height: 1,
                    )),
                ScrollItem(
                  height: 30,
                    child: Text("Relationships * Results * Reputation")),
                SizedBox(height: 2000,)
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ScrollItem extends StatelessWidget {
  final double topPadding, bottomPadding, height, width;
  final Widget child;

  const ScrollItem(
      {Key? key,
      double this.topPadding = 0,
      double this.bottomPadding = 0,
      double this.height = 100,
      double this.width = 800,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
        child: FittedBox(
          child: Container(
            width: width,
            height: height,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Align(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
