
import 'dart:math';
import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';

import '../../main.dart';

class ScrollWindowMobile extends StatelessWidget{
  final double topPadding, bottomPadding;
  final List<Widget> pages;
  final pageIndex = PageIndex();

  ScrollWindowMobile({Key? key, required this.pages, double this.topPadding=0, double this.bottomPadding=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: Provider.of<PageIndex>(context, listen: false).getIndex(pageIndex)as int);
    double width = min(MediaQuery.of(context).size.width - 30, 1300);
    double height = min(MediaQuery.of(context).size.height-70, 600);



    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Align(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.white.withOpacity(0.3),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    drawer: Drawer(),
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
                              onPageChanged: (index){
                                Provider.of<PageIndex>(context, listen: false).updateIndex(pageIndex, index);
                              },
                              controller: pageController,
                              itemCount: pages.length,
                              itemBuilder: (c,i){
                                return pages[i];
                              }),
                        ),
                        // Align(
                        //   alignment: Alignment.topCenter,
                        //   child: DotsIndicator(
                        //     dotsCount: this.pages.length,
                        //     decorator: DotsDecorator(
                        //       //color: Colors.black,
                        //       activeColor: MyTheme.primary,
                        //     ),
                        //     position: Provider.of<PageIndex>(context).getIndex(pageIndex),
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Builder(builder: (context)=>IconButton(color:Colors.black,iconSize: 30, icon: Icon(Icons.apps_rounded), onPressed: () {  Scaffold.of(context).openDrawer();},)),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(color: Colors.black, iconSize: 40, icon: Icon(Icons.arrow_back_rounded), onPressed: () {  pageController.previousPage(duration: Duration(milliseconds: 600), curve: Curves.ease);},),
                              IconButton(color: Colors.black, iconSize: 40, icon: Icon(Icons.arrow_forward_rounded), onPressed: () {  pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease);},)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}