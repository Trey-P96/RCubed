
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
    double width = min(MediaQuery.of(context).size.width - 50, 1300);
    double height = min(MediaQuery.of(context).size.height-150, 600);



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
                    endDrawer: Drawer(),
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
                        Align(
                          alignment: Alignment.topCenter,
                          child: DotsIndicator(
                            dotsCount: this.pages.length,
                            decorator: DotsDecorator(
                              //color: Colors.black,
                              activeColor: MyTheme.primary,
                            ),
                            position: Provider.of<PageIndex>(context).getIndex(pageIndex),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Builder(builder: (context)=>IconButton(color:MyTheme.primary,iconSize: 30, icon: Icon(Icons.apps_rounded), onPressed: () {  Scaffold.of(context).openEndDrawer();},)),
                        ),

                        // Scaffold(
                        //   endDrawerEnableOpenDragGesture: false,
                        //   backgroundColor: Colors.transparent,
                        //   appBar: AppBar(
                        //     actions: [
                        //       Builder(
                        //         builder: (context)=>IconButton(onPressed: (){
                        //           Scaffold.of(context).openEndDrawer();
                        //         }, icon: Icon(Icons.dataset)),
                        //       )
                        //     ],
                        //     backgroundColor: Colors.transparent,
                        //     elevation: 0,
                        //     iconTheme: IconThemeData(color: Colors.black, size: 40),
                        //   ),
                        //   endDrawer: Drawer(),
                        //   body: Stack(
                        //     children: [
                        //       Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: AnimatedOpacity(
                        //           opacity: Provider.of<MyOpacity>(context).getOpacity(leftOpacity),
                        //           duration: Duration(milliseconds: 200),
                        //           child: Listener(
                        //             onPointerDown: (pointer){
                        //               if(pointer.kind == PointerDeviceKind.mouse){
                        //                 pageController.previousPage(duration: Duration(milliseconds: 600), curve: Curves.ease);
                        //               }
                        //
                        //             },
                        //             child: MouseRegion(
                        //               opaque: Provider.of<MouseInput>(context).isMouse,
                        //               onEnter: (cursor){
                        //                 Provider.of<MyOpacity>(context, listen: false).fadeIn(leftOpacity);
                        //               },
                        //               onExit: (cursor){
                        //                 Provider.of<MyOpacity>(context, listen: false).fadeOut(leftOpacity);
                        //               },
                        //               child: Container(
                        //                 alignment: Alignment.centerLeft,
                        //                 // color: Colors.black,
                        //                 width: width/2,
                        //                 child: SizedBox(
                        //                   // color: Colors.black,
                        //                     height: height * 0.15,
                        //                     child: FittedBox(child: Icon(Icons.arrow_back_ios, color: Colors.black.withOpacity(0.5)))),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.centerRight,
                        //         child: AnimatedOpacity(
                        //           opacity: Provider.of<MyOpacity>(context).getOpacity(rightOpacity),
                        //           duration: Duration(milliseconds: 200),
                        //           child: Listener(
                        //             onPointerDown: (pointer){
                        //               if(pointer.kind == PointerDeviceKind.mouse){
                        //                 pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.ease);
                        //               }
                        //
                        //             },
                        //             child: MouseRegion(
                        //               opaque: Provider.of<MouseInput>(context).isMouse,
                        //               onEnter: (cursor){
                        //                 Provider.of<MyOpacity>(context, listen: false).fadeIn(rightOpacity);
                        //               },
                        //               onExit: (cursor){
                        //                 Provider.of<MyOpacity>(context, listen: false).fadeOut(rightOpacity);
                        //               },
                        //               child: Container(
                        //                 alignment: Alignment.centerRight,
                        //                 // color: Colors.black,
                        //                 width: width/2,
                        //                 child: SizedBox(
                        //                     height: height * 0.15,
                        //                     child: FittedBox(child: Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.5),))),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

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