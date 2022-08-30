import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/providers/what_we_do_providers.dart';
import '../../../network_images/network_images.dart';
import '../../../providers/device_provider.dart';
import '../../../themes/rcubed_theme.dart';

class WhatWeDo extends StatefulWidget {
  const WhatWeDo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WhatWeDoState();
  }
}

class WhatWeDoState extends State<WhatWeDo> with TickerProviderStateMixin{
  final key = GlobalKey();
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();
  final navBarKey = GlobalKey();


  void scrollToIndex() {
    nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: Duration(seconds: 1), alignment: 0);
  }

  void updateSize(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? box = navBarKey.currentContext?.findRenderObject() as RenderBox?;
      //RenderBox? appBar = appBarKey.currentContext?.findRenderObject() as RenderBox;
      if(box != null){
        Provider.of<AppBarProvider>(context, listen: false).updateHeight(box.size.height);
      }

    });
  }

  void listen(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nestedScrollKey.currentState!.outerController.addListener(() {
        if(nestedScrollKey.currentState!.outerController.offset == 0){
          Provider.of<AppBarProvider>(context, listen: false).updateOpacity(true);
        } else{
          Provider.of<AppBarProvider>(context, listen: false).updateOpacity(false);
        }
      });
    });
  }


  @override
  void initState(){
    super.initState();
    updateSize();
    listen();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateSize();
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
        NestedScrollView(
              key: nestedScrollKey,
              headerSliverBuilder: (context, innerBoxIsScrolled){
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverSafeArea(
                      sliver: SliverAppBar(
                        forceElevated: true,
                        elevation: 5,
                        expandedHeight: Provider.of<AppBarProvider>(context).getHeight(),
                        actions: [Container()],
                        backgroundColor: Colors.white,
                        title: Center(child: Text("What We Do", style: TextStyle(color: Colors.black, fontSize: 30),)),
                        pinned: Provider.of<DeviceProvider>(context).getDevice() == PointerDeviceKind.touch? false:true,
                        flexibleSpace: SingleChildScrollView(
                          //key: appBarKey,
                          physics: NeverScrollableScrollPhysics(),
                          controller: ScrollController(),
                          child: Container(
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                            child: MediaQuery.of(context).size.width < 650?
                            Align(
                              key: navBarKey,
                              child: Padding(
                                padding: const EdgeInsets.only(top: kToolbarHeight+10),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    _MenuButton(title: "Enterprise Applications",),
                                    _MenuButton(title: "Integration Architecture"),
                                    _MenuButton(title: "Cloud Computing"),
                                    _MenuButton(title: "Managed Services"),
                                    _MenuButton(title: "Co Sourcing"),
                                    _MenuButton(title: "Technologies"),

                                  ],
                                ),
                              ),
                            )
                                :
                            Padding(
                              key: navBarKey,
                              padding: const EdgeInsets.only(top: kToolbarHeight+10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _MenuButton(title: "Enterprise Applications"),
                                      _MenuButton(title: "Integration Architecture"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _MenuButton(title: "Cloud Computing"),
                                      _MenuButton(title: "Managed Services"),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _MenuButton(title: "Co Sourcing"),
                                      _MenuButton(title: "Technologies"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ];
              },
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        EnterpriseApplications(key: key,),
                        IntegrationArchitecture(),
                        CloudComputing(),
                        ManagedServices(),
                        CoSourcing(),
                        Technologies(),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    child: AnimatedOpacity(
                        opacity: Provider.of<AppBarProvider>(context).isExpanded()? 1:0,
                        duration: Duration(milliseconds: 400),
                        child: Container(color: Colors.black.withOpacity(0.5),),
                    ),
                  ),
                ],
              ),
              ),


      ],
    );
  }
}

class _MenuButton extends StatelessWidget{
  final String title;
  _MenuButton({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter: (pointer){
          Provider.of<AppBarProvider>(context, listen: false).updateColor(Colors.grey);
        },
        onExit:(pointer){
          Provider.of<AppBarProvider>(context, listen: false).updateColor(Colors.transparent);
        },
        child: AnimatedContainer(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              color: Provider.of<AppBarProvider>(context).getColor(),
              borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          duration: Duration(milliseconds: 500),
          child: Center(child: Text(title, style: TextStyle(color: Colors.black),)),
        ),
      ),
    );
  }
}



// SliverAppBar(
// forceElevated: true,
// elevation: 5,
// title: Center(child: Text("What We Do", style: TextStyle(color: Colors.black),)),
// pinned: Provider.of<DeviceProvider>(context).getDevice() == PointerDeviceKind.touch? false:true,
// flexibleSpace: SingleChildScrollView(
// child: Container(
// decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
// //height: Provider.of<AppBarProvider>(context).getHeight()+kToolbarHeight,
// child: MediaQuery.of(context).size.width < 600?
// Align(
// child: Wrap(
// // key: navBarKey,
// alignment: WrapAlignment.spaceEvenly,
// //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _MenuButton(title: "Enterprise Applications",),
// _MenuButton(title: "Integration Architecture"),
// _MenuButton(title: "Cloud Computing"),
// _MenuButton(title: "Managed Services"),
// _MenuButton(title: "Co Sourcing"),
// _MenuButton(title: "Technologies"),
//
// ],
// ),
// )
// :
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _MenuButton(title: "Enterprise Applications"),
// _MenuButton(title: "Integration Architecture"),
// ],
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _MenuButton(title: "Cloud Computing"),
// _MenuButton(title: "Managed Services"),
// ],
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _MenuButton(title: "Co Sourcing"),
// _MenuButton(title: "Technologies"),
// ],
// ),
// ],
// ),
// ),
// ),
//
// floating: true,
// snap: true,
// expandedHeight: height,
// //actions: [ElevatedButton(onPressed: (){scrollToIndex();}, child: Text("Press"))],
// actions: [Container()],
// backgroundColor: Colors.white,
// ),


/*
_MenuButton(title: "Enterprise Applications",),
_MenuButton(title: "Integration Architecture"),
_MenuButton(title: "Cloud Computing"),
_MenuButton(title: "Managed Services"),
_MenuButton(title: "Co Sourcing"),
_MenuButton(title: "Technologies"),*/

// class Header extends SliverPersistentHeaderDelegate{
//   final TickerProvider vsync;
//   final Function() callBack;
//   Header({required this.vsync, required this.callBack}):super();
//
//
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // TODO: implement build
//     return Material(
//       elevation: 10,
//       child: Stack(
//         children: [
//           Container(color: RCubedTheme.primary,),
//           ElevatedButton(onPressed: (){callBack();}, child: Text("PRESS")),
//         ],
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement maxExtent
//   double get maxExtent => 300;
//
//   @override
//   // TODO: implement minExtent
//   double get minExtent => 60;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     // TODO: implement shouldRebuild
//     return true;
//   }
//
//   // @override
//   // FloatingHeaderSnapConfiguration get snapConfiguration => FloatingHeaderSnapConfiguration(
//   //   curve: Curves.easeInOut,
//   //   duration: Duration(milliseconds: 300),
//   // );
//
//
// }