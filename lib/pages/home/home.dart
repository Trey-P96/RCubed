import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/pages/home/who_we_are/who_we_are.dart';
import 'package:rcubed/pages/home/why_us/why_us.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/widgets/custom_column/custom_column.dart';
import 'package:rcubed/widgets/logo/logo_complete.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/device_listener/device_listener.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/nav_bar/nav_list.dart';
import '../../widgets/nested_navbar/nested_navbar.dart';
import '../../widgets/smooth_scrolling/smooth_scrolling.dart';
import 'contact/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'home_page_view/home_page_view.dart';




class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // TODO: implement build
    return SafeArea(
      child: DeviceListener(
        child: Scaffold(
          //key: scaffoldKey,
            endDrawer: Drawer(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: const Center(child: NavList()),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 5,
              title: const NavBar(),
              actions: [Container()],
              titleSpacing: 0,
            ),
            body: const _Home()),
      ),
    );
  }

}




class _Home extends StatefulWidget{
  const _Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<_Home>{
  //GlobalKey<SmoothScrollState> key = GlobalKey<SmoothScrollState>();
  ScrollController testController = ScrollController();
  GlobalKey key = GlobalKey();


  List<Widget> pages = [
        // const WhatWeDo(),
        // WhoWeAre(),
        // WhyUs(),
        // const Contact(),
  ];

  List<Widget> myList = [];

  get scrollToIndex => null;


  @override
  void initState(){
    super.initState();
    //Provider.of<PrimaryScrollProvider>(context, listen: false).updateKey(key);


    myList = [
      Column(
        children: const [
          HomePageView(),
          WhatWeDo(),
          WhoWeAre(),
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ProviderScope(
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          Background(path: Images.background,),
          Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Stack(
                children: [
                  Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
                  CustomScrollView(
                    controller: testController,
                    physics: const CustomScrollPhysics(),
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index){
                                return myList[index];
                              },
                            childCount: myList.length,
                            addRepaintBoundaries: false,
                            addAutomaticKeepAlives: false
                          )
                      )
                    ],
                  ),
                ],
              )
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('/test');
              }, child: const Text("PRESS")),
            ),
          )
        ],
      ),
    );
  }

}