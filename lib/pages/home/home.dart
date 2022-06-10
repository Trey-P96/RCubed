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
                ScrollItem(
                  width: 650,
                    topPadding: 40,
                    height: 175,
                    child: Logo()),
                ScrollItem(
                  width: 650,
                    topPadding: 30,
                    height: 40,
                    bottomPadding: 10,
                    child: Text("R-CUBED CONSULTING",
                      style: TextStyle(
                          fontFamily: "Roboto-Thin",
                          fontWeight: FontWeight.w100),)),
                ScrollItem(
                  width: 650,
                    height: 0.5,
                    child: Container(
                      color: Colors.black,
                      width: 1150,
                      height: 1,
                    )),
                ScrollItem(
                  width: 650,
                  height: 30,
                    topPadding: 10,
                    child: Text("Relationships * Results * Reputation",
                    style: TextStyle(
                        fontFamily: "Roboto-Thin",
                        fontWeight: FontWeight.w100),)),
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
            //color: Colors.white,
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
