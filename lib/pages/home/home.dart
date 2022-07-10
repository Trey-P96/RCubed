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
import 'package:rcubed/pages/home/content/what_we_do.dart';
import 'package:rcubed/pages/what_we_do/enterprise_applications.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import 'package:rcubed/widgets/scroll_window/scroll_window.dart';
import '../../themes/theme.dart';
import '../../widgets/adaptive_scroll.dart';
import '../../widgets/backgroundImage.dart';
import '../../widgets/navigation_bar/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../what_we_do/what_we_do.dart';

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

            AdaptiveScroll(
              [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ScrollItem(
                          boxfit: BoxFit.fitHeight,
                          topPadding: 50,
                          height: min(MediaQuery.of(context).size.height - 100, 400),
                          width: 600,
                          child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/RcubedLogoFinal.svg',
                                  fit: BoxFit.fitHeight,
                                  //color: MyTheme().primary.withOpacity(1),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: SvgPicture.asset(
                                    'assets/images/relresrep.svg',
                                    //color: MyTheme().primary.withOpacity(1),
                                  ),
                                )
                              ],
                            ),
                        ),
                      ),
                    ],
                  ),


                ScrollWindow( // WHAT WE DO
                  topPadding: 45,
                  bottomPadding: 0,
                  pages: [
                    WhatWeDo(),
                    EnterpriseApp(),
                  ],
                ),

                ScrollWindow(
                  topPadding: 45,
                  bottomPadding: 0,
                  pages: [
                    PageTwo(),
                    PageTwo(),
                    PageTwo(),
                  ],
                ),

                ScrollWindow(
                  topPadding: 45,
                    bottomPadding: 0,
                    pages: [
                      PageThree(),
                      PageThree(),
                      PageThree(),
                      PageThree(),
                    ]
                ),

                ScrollWindow(
                    topPadding: 45,
                    bottomPadding: 0,
                    pages: [
                      PageFour(),
                      PageFour(),
                      PageFour(),
                      PageFour(),
                    ]
                ),

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
        NavBar(),
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
