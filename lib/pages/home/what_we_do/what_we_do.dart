import 'dart:async';
import 'dart:math';
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
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();
  final navBarKey = GlobalKey();

  final enterpriseAppKey = GlobalKey();
  final integrationArchKey = GlobalKey();
  final cloudCompKey = GlobalKey();
  final managedServiceKey = GlobalKey();
  final coSourceKey = GlobalKey();
  final technologyKey = GlobalKey();


  void scrollToIndex(GlobalKey key) {
    if(key == enterpriseAppKey){
      nestedScrollKey.currentState!.outerController.position.animateTo(nestedScrollKey.currentState!.outerController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
    else{
      nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: Duration(seconds: 1), alignment: 0);
    }
  }

  void updateSize(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? box = navBarKey.currentContext?.findRenderObject() as RenderBox?;
      if(box != null){
        Provider.of<WhatWeDoProvider>(context, listen: false).updateHeight(box.size.height);
      }

    });
  }

  void listen(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nestedScrollKey.currentState!.outerController.addListener(() {
        if(nestedScrollKey.currentState!.outerController.offset == 0){
          Provider.of<WhatWeDoProvider>(context, listen: false).updateOpacity(true);
        } else{
          Provider.of<WhatWeDoProvider>(context, listen: false).updateOpacity(false);
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
              //floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled){
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverSafeArea(
                      sliver: SliverAppBar(
                        forceElevated: true,
                        elevation: 5,
                        expandedHeight: Provider.of<WhatWeDoProvider>(context).getHeight(),
                        actions: [Container()],
                        backgroundColor: Colors.white,
                        title: Center(child: Text("What We Do", style: TextStyle(color: Colors.black, fontSize: 30),)),
                        //pinned: Provider.of<DeviceProvider>(context).getDevice() == PointerDeviceKind.touch? false:true,
                        pinned: true,
                        flexibleSpace: SingleChildScrollView(
                          //key: appBarKey,
                          physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                            child: Align(
                              key: navBarKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: kToolbarHeight+10),
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Wrap(
                                      alignment: WrapAlignment.spaceEvenly,
                                      children: [
                                        //Divider(),
                                        MenuButton(title: "Enterprise Applications", scrollToIndex: scrollToIndex, pageKey: enterpriseAppKey,),
                                        MenuButton(title: "Integration Architecture", scrollToIndex: scrollToIndex,pageKey: integrationArchKey,),
                                        MenuButton(title: "Cloud Computing", scrollToIndex: scrollToIndex,pageKey: cloudCompKey,),
                                        MenuButton(title: "Managed Services", scrollToIndex: scrollToIndex,pageKey: managedServiceKey,),
                                        MenuButton(title: "Co Sourcing", scrollToIndex: scrollToIndex,pageKey: coSourceKey,),
                                        MenuButton(title: "Technologies", scrollToIndex: scrollToIndex,pageKey: technologyKey,),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                        EnterpriseApplications(key: enterpriseAppKey,),
                        IntegrationArchitecture(key: integrationArchKey,),
                        CloudComputing(key: cloudCompKey,),
                        ManagedServices(key: managedServiceKey,),
                        CoSourcing(key: coSourceKey,),
                        Technologies(key: technologyKey,),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    child: AnimatedOpacity(
                        opacity: Provider.of<WhatWeDoProvider>(context).isExpanded()? 1:0,
                        duration: Duration(milliseconds: 400),
                        child: Container(color: Colors.black.withOpacity(0.6),),
                    ),
                  ),
                ],
              ),
              ),


      ],
    );
  }
}

class MenuButton extends StatelessWidget{
  final String title;
  final Function(GlobalKey) scrollToIndex;
  final GlobalKey pageKey;
  MenuButton({required this.title, required this.pageKey, required this.scrollToIndex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: (){
          scrollToIndex(pageKey);
        },
        child: Container(
            width: 200,
            height: 50,
            child: Center(
                child: Text(title,
                  style: TextStyle(
                      color: Colors.black),)
            )
        )
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