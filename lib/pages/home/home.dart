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

import '../what_we_do/what_we_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController();

  List<Widget> pageItems = [
    TestScrollObject(),
    Container(color: Colors.blue,),
    Container(color: Colors.orange,)
  ];

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      int direction = _pageController.position.userScrollDirection.index;
      Provider.of<AbsorbInput>(context, listen: false).updateScrollDirection(direction);
    });

    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Flutter Demo5"),
              ),
              backgroundColor: MyTheme.primary,
              shadowColor: Colors.black,
              floating: true,
              //pinned: true,

            ),
          ];
        },
        body: PageView.builder(
            itemCount: pageItems.length,
            scrollDirection: Axis.vertical,
            controller: _pageController,
            pageSnapping: false,
            itemBuilder: (c, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: pageItems[i],
              );
            }),
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
//     // TODO: implement build
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

class TestScrollObject extends StatelessWidget{
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  DraggableScrollableController dragController = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      print(scrollController.offset);
      if(scrollController.position.atEdge){
        Provider.of<AbsorbInput>(context,listen: false).setPhysics(NeverScrollableScrollPhysics());
        Provider.of<AbsorbInput>(context,listen: false).setAbsorb(true);
        // scrollController.position.context.
      }
    });
    // TODO: implement build
    return GestureDetector(
      onPanDown: (pan){
        Provider.of<AbsorbInput>(context,listen: false).setAbsorb(false);
      },
      onPanStart: (pan){
        Provider.of<AbsorbInput>(context,listen: false).setAbsorb(false);
      },
      child: AbsorbPointer(
        absorbing: Provider.of<AbsorbInput>(context).isAbsorbing(),
        child: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            physics: ClampingScrollPhysics(),
            //physics: Provider.of<AbsorbInput>(context).getScrollPhysics(),
            itemBuilder: (c,i){
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(height: 100,
                  color: Colors.black,),
              );
            }
        ),
      ),
    );
  }

}
