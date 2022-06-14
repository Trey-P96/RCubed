import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import 'package:rcubed/widgets/scroll_window.dart';
import '../../themes/theme.dart';
import '../../widgets/adaptive_scroll.dart';
import '../../widgets/backgroundImage.dart';
import '../../widgets/navigation_bar/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    // TODO: implement build
    return Stack(
      children: [
        const Background(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavBar(),
            AdaptiveScroll(
              [
                ScrollItem(
                    topPadding: 30,
                    height: min(MediaQuery.of(context).size.height - 120, 300),
                    width: 550,
                    child: SvgPicture.asset(
                      'assets/images/RcubedLogoFinal.svg',
                      fit: BoxFit.fitHeight,
                      //color: MyTheme().primary.withOpacity(1),
                    )),
                ScrollItem(
                    topPadding: 20,
                    sidePadding: 20,
                    bottomPadding: 50,
                    boxfit: BoxFit.fitWidth,
                    height: min(MediaQuery.of(context).size.height - 120, 50),
                    width: 550,
                    child: SvgPicture.asset(
                      'assets/images/relresrep.svg',
                      fit: BoxFit.fitHeight,
                      //color: MyTheme().primary.withOpacity(1),
                    )),

                ScrollWindow(),

                // SizedBox(
                //   height: 2000,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Container(
                    height: 200,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ScrollItem extends StatelessWidget {
  final double topPadding,
      bottomPadding,
      sidePadding,
      height,
      width;
  final Widget child;
  final BoxFit boxfit;

  const ScrollItem(
      {Key? key,
      double this.topPadding = 0,
      double this.bottomPadding = 0,
      double this.sidePadding = 0,
      double this.height = 100,
      double this.width = 800,
      BoxFit this.boxfit = BoxFit.fitHeight,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: Padding(
        padding: EdgeInsets.fromLTRB(sidePadding, topPadding, sidePadding, bottomPadding),
        child: FittedBox(
          child: Container(
            // color: Colors.white,
            width: width,
            height: height,
            child: FittedBox(
              fit: boxfit,
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
