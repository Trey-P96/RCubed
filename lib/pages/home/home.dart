import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/pages/home/who_we_are/who_we_are.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../custom_scroll_physics/custom_scroll_physics.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/device_listener/device_listener.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/nav_bar/nav_list.dart';
import 'home_page_view/home_page_view.dart';




final navBarProvider = StateProvider<GlobalKey<ScaffoldState>>((ref) => GlobalKey());
final homePageProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final whatWeDoProvider = StateProvider<GlobalKey>((ref)=>GlobalKey());
final whoWeAreProvider = StateProvider<GlobalKey>((ref) => GlobalKey());

class Home extends ConsumerWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          //extendBodyBehindAppBar: true,
          key: ref.watch(navBarProvider),
          endDrawer: Drawer(
            backgroundColor: Colors.white.withOpacity(0.95),
            child: const Center(child: NavList()),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //foregroundColor: Colors.transparent,
            elevation: 5,
            title: const NavBar(),
            actions: [Container()],
            titleSpacing: 0,
          ),
          body: const _Home()),
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
  List<Widget> pages = [];


  @override
  void initState(){
    super.initState();



    pages = [
      Column(
        children: const [
          WhatWeDoNavBar(),
          HomePageView(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          WhatWeDoNavBar(),
          //const WhatWeDo(),
          // EnterpriseApplications(),
          // IntegrationArchitecture(),
          // CloudComputing(),
          // ManagedServices(),
          // CoSourcing(),
          // Technologies(),
          WhoWeAre(),
        ],
      )

    ];
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Stack(
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

                // ScrollablePositionedList.builder(
                //     // minCacheExtent: 500000,
                //     physics: const CustomScrollPhysics(),
                //     itemCount: pages.length,
                //     addRepaintBoundaries: false,
                //     addAutomaticKeepAlives: false,
                //     itemBuilder: (context, index){
                //       return pages[index];
                //     }),


                CustomScrollView(
                    shrinkWrap: true,
                    physics: const CustomScrollPhysics(),
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate.fixed(
                              pages,
                              addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                          )
                      )
                    ],
                  ),


              ],
            )
          ),
        ),

        // Align(
        //   alignment: Alignment.topLeft,
        //   child: SizedBox(
        //     width: 200,
        //     height: 60,
        //     child: ElevatedButton(onPressed: (){
        //       Navigator.of(context).pushNamed('/test');
        //     }, child: const Text("PRESS2")),
        //   ),
        // )
      ],
    );
  }

}