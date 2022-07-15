import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/home/content/rcubed_branding.dart';
import 'package:rcubed/pages/home/content/what_we_do.dart';
import 'package:rcubed/pages/what_we_do/enterprise_applications.dart';
import 'package:rcubed/widgets/page_scroll.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import '../../themes/theme.dart';
import '../../widgets/adaptive_scroll.dart';
import '../../widgets/backgroundImage.dart';
import '../../widgets/navigation_bar/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/smooth_scroll/smooth_list_scroll.dart';
import '../what_we_do/what_we_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  List<Widget> pageItems = [
    Container(
      color: Colors.blue,
    ),
    SmoothListScroll(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 400, color: Colors.red,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 400, color: Colors.orange,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 400, color: Colors.red,),
        ),
      ],
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.orange,
    )
  ];

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: Stack(
        children: [
          Background(),

          PageView.builder(
              // dragStartBehavior: DragStartBehavior.down,
              itemCount: pageItems.length,
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: _pageController,
              // physics: ClampingScrollPhysics(),
              pageSnapping: false,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: pageItems[i],
                );
              }),

          NavBar(),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // final pageController = PageController();
//
//     // pageController.addListener(() {
//     //   print(pageController.page);
//     // });
//     
//     return Stack(
//       children: [
//         const Background(),
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//
//             PageScroll(
//                 pageDescription: "Home Page",
//                 children: [
//                   ScrollPage( // WHAT WE DO
//                     topPadding: 45,
//                     bottomPadding: 0,
//                     description: "What We Do",
//                     pages: [
//                       WhatWeDo(),
//                       EnterpriseApp(),
//                     ],
//                   ),
//
//                   ScrollPage(
//                     topPadding: 45,
//                     bottomPadding: 0,
//                     description: "Careers",
//                     pages: [
//                       RCubed(),
//                       PageTwo(),
//                       PageTwo(),
//                     ],
//                   ),
//
//                   ScrollPage(
//                       topPadding: 45,
//                       bottomPadding: 0,
//                       description: "Contact",
//                       pages: [
//                         PageThree(),
//                         PageThree(),
//                         PageThree(),
//                         PageThree(),
//                       ]
//                   ),
//             ]),
//             // AdaptiveScroll(
//             //
//             //   [
//             //       //RCubed(),
//             //       Column(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           Padding(
//             //             padding: EdgeInsets.only(left: 10, right: 10),
//             //             child: ScrollItem(
//             //               boxfit: BoxFit.fitHeight,
//             //               topPadding: 50,
//             //               height: min(MediaQuery.of(context).size.height - 100, 400),
//             //               width: 600,
//             //               child: Column(
//             //                   children: [
//             //                     SvgPicture.asset(
//             //                       'assets/images/RcubedLogoFinal.svg',
//             //                       fit: BoxFit.fitHeight,
//             //                       //color: MyTheme().primary.withOpacity(1),
//             //                     ),
//             //                     Padding(
//             //                       padding: EdgeInsets.only(top: 30),
//             //                       child: SvgPicture.asset(
//             //                         'assets/images/relresrep.svg',
//             //                         //color: MyTheme().primary.withOpacity(1),
//             //                       ),
//             //                     )
//             //                   ],
//             //                 ),
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //
//             //
//             //
//             //
//             //     ScrollWindow( // WHAT WE DO
//             //       topPadding: 45,
//             //       bottomPadding: 0,
//             //       description: "What We Do",
//             //       pages: [
//             //         WhatWeDo(),
//             //         EnterpriseApp(),
//             //       ],
//             //     ),
//             //
//             //     ScrollWindow(
//             //       topPadding: 45,
//             //       bottomPadding: 0,
//             //       description: "Careers",
//             //       pages: [
//             //         RCubed(),
//             //         PageTwo(),
//             //         PageTwo(),
//             //       ],
//             //     ),
//             //
//             //     ScrollWindow(
//             //       topPadding: 45,
//             //         bottomPadding: 0,
//             //         description: "Contact",
//             //         pages: [
//             //           PageThree(),
//             //           PageThree(),
//             //           PageThree(),
//             //           PageThree(),
//             //         ]
//             //     ),
//             //
//             //     ScrollWindow(
//             //         topPadding: 45,
//             //         bottomPadding: 0,
//             //         description: "Why Us",
//             //         pages: [
//             //           PageFour(),
//             //           PageFour(),
//             //           PageFour(),
//             //           PageFour(),
//             //         ]
//             //     ),
//             //
//             //     // SizedBox(
//             //     //   height: 2000,
//             //     // ),
//             //     Padding(
//             //       padding: EdgeInsets.only(top: 40),
//             //       child: Container(
//             //         height: 200,
//             //         color: Colors.grey,
//             //       ),
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//         NavBar(),
//       ],
//     );
//   }
// }



class NestedScrollableWidget extends StatelessWidget {
  final List<Widget> children;
  NestedScrollableWidget({required this.children, Key? key}) : super(key: key);

  ScrollController scrollController = ScrollController();
  PointerDeviceKind device = PointerDeviceKind.mouse;

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && device == PointerDeviceKind.touch) {
        Provider.of<AbsorbInput>(context, listen: false).setAbsorb(true);
      }
    });

    
    return Listener(
      onPointerSignal: (pointer)=>device = pointer.kind,
      onPointerDown: (pointer)=>device = pointer.kind,
      onPointerHover: (pointer)=>device = pointer.kind,
      child: GestureDetector(
        onPanDown: (pan) {
          Provider.of<AbsorbInput>(context, listen: false).setAbsorb(false);
        },
        onPanStart: (pan) {
          Provider.of<AbsorbInput>(context, listen: false).setAbsorb(false);
        },
        child: AbsorbPointer(
          absorbing: Provider.of<AbsorbInput>(context).isAbsorbing(),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: RawScrollbar(
              thumbColor: Colors.black,
              thickness: 0,
              controller: scrollController,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: children.length,
                  physics: ClampingScrollPhysics(),
                  //physics: Provider.of<AbsorbInput>(context).getScrollPhysics(),
                  itemBuilder: (c, i) {
                    return children[i];
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
