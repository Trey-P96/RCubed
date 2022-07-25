import 'dart:math';
import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:rcubed/widgets/blurredBox.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page.dart';

import '../../main.dart';

class ScrollPageMobile extends StatelessWidget {
  final double topPadding, bottomPadding;
  final List<Widget> pages;
  final String description;
  ScrollPageMobile(
      {Key? key,
      required this.pages,
        required this.description,
      double this.topPadding = 0,
      double this.bottomPadding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    //print(description + Provider.of<PageHandler>(context,listen: false).isAbsorbing(description).toString());
    final pageController = PageController();
    double width = min(MediaQuery.of(context).size.width - 30, 1300);
    double height = min(MediaQuery.of(context).size.height - 70, 600);
    
    return AbsorbPointer(
      //absorbing: Provider.of<PageHandler>(context).isAbsorbing(description),
      absorbing: false,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Align(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                //width: width,
                //height: height,
                color: Colors.white.withOpacity(0.3),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  endDrawer: Drawer(
                    backgroundColor: Colors.black.withOpacity(0.8),
                  ),
                  body: Stack(
                    children: [
                      RawScrollbar(
                        thumbColor: MyTheme.primary,
                        //trackVisibility: true,
                        controller: pageController,
                        thumbVisibility: true,
                        radius: Radius.zero,
                        thickness: 5,
                        child: PageView.builder(
                            onPageChanged: (index) {
                              Provider.of<PageIndex>(context, listen: false)
                                  .updateIndex(description, index);
                            },
                            controller: pageController,
                            itemCount: pages.length,
                            itemBuilder: (c, i) {
                              return pages[i];
                            }),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Builder(
                            builder: (context) => BlurredBox(
                              child: IconButton(
                                    color: Colors.white,
                                    iconSize: 30,
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.apps_rounded),
                                    onPressed: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                  ),
                              width: 30,
                              height: 30,
                              radius: 5,
                              padding: EdgeInsets.all(10),
                              opacity: 0.5,
                            ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlurredBox(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                              color: Colors.white,
                              iconSize: 30,
                              icon: Icon(Icons.arrow_back_rounded),
                              onPressed: () {
                                pageController.previousPage(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.ease);
                              },
                            ),
                              width: 30,
                              height: 30,
                              radius: 5,
                              padding: EdgeInsets.all(10),
                              opacity: 0.5,
                            ),

                            // BlurredBox(
                            //   width: 200,
                            //     height: 30,
                            //     radius: 5,
                            //     child: DotsIndicator(
                            //       dotsCount: 5,
                            //       decorator: DotsDecorator(
                            //         color: Colors.white,
                            //         activeSize: Size(12,12),
                            //       ),
                            //     )),


                            BlurredBox(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                color: Colors.white,
                                iconSize: 30,
                                icon: Icon(Icons.arrow_forward_rounded),
                                onPressed: () {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.ease);
                                },
                              ),
                              width: 30,
                              height: 30,
                              radius: 5,
                              padding: EdgeInsets.all(10),
                              opacity: 0.5,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
