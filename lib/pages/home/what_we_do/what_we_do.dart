import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_scroll_to_index/easy_scroll_to_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:image_network/image_network.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

import '../../../network_images/network_images.dart';

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



  void scrollToIndex() {
    nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: Duration(seconds: 1), alignment: 0);
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        title: Center(child: Text("What We Do")),
                        pinned: Provider.of<DeviceProvider>(context).getDevice() == PointerDeviceKind.touch? false:true,
                        flexibleSpace: SingleChildScrollView(
                          controller: ScrollController(),
                          physics: NeverScrollableScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              height: 200,
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
                            )
                          ),
                        ),
                        //floating: true,
                        //snap: true,
                        expandedHeight: 220,
                        //actions: [ElevatedButton(onPressed: (){scrollToIndex();}, child: Text("Press"))],
                        actions: [Container()],
                        backgroundColor: RCubedTheme.primary,
                      ),
                    ),
                  ),

                ];
              },
              body: SingleChildScrollView(
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
              ),


      ],
    );

  }
}

class _MenuButton extends StatelessWidget{
  final String title;
  _MenuButton({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, style: TextStyle(color: Colors.white),),
      ),
      decoration: BoxDecoration(
          color: RCubedTheme.offPrimary,
          borderRadius: BorderRadius.all(Radius.circular(25))
      ),
    );
  }

}

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