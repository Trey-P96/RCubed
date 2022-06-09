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
            const AdaptiveScroll(
              [
                ScrollItem(
                  child: Logo(),
                  topPadding: 50,
                  maxHeight: 200,
                  minHeight: 80,
                ),
                ScrollItem(
                    child: Text(
                      "R-CUBED CONSULTING",
                      style: TextStyle(fontSize: 60),
                    ),
                  topPadding: 30,
                  maxHeight: 50,
                  minHeight: 10,
                ),
                ScrollItem(child: SizedBox(height: 1000,)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ScrollItem extends StatelessWidget {
  final double
      topPadding,
      bottomPadding,
      maxHeight,
      minHeight;
  final Widget child;

  const ScrollItem({Key? key,
    double this.topPadding=0,
    double this.bottomPadding=0,
    double this.maxHeight=double.infinity,
    double this.minHeight=0,
    required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
      child: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: minHeight,
            maxHeight: maxHeight
          ),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(500, 0, 500, 0),
                child: child),
          ),
        ),
      ),
    );
  }
}
