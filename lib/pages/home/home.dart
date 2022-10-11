import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';

import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/pages/home/who_we_are/who_we_are.dart';
import 'package:rcubed/pages/home/why_us/why_us.dart';
import 'package:rcubed/widgets/custom_column/custom_column.dart';
import 'package:rcubed/widgets/custom_painter/custom_painter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../custom_scroll_physics/custom_scroll_physics.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/column_builder/column_builder.dart';
import '../../widgets/device_listener/device_listener.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/nav_bar/nav_list.dart';
import '../../widgets/nested_navbar/nested_navbar.dart';
import '../../widgets/widget_builder/widget_builder.dart';
import 'footer/footer.dart';
import 'home_page_view/home_page_view.dart';
import 'package:visibility_detector/visibility_detector.dart';



final StateProvider<ScrollController> scrollController = StateProvider((ref) => ScrollController());

final navBarProvider = StateProvider<GlobalKey<ScaffoldState>>((ref) => GlobalKey());
final homePageProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final whatWeDoProvider = StateProvider<GlobalKey>((ref)=>GlobalKey());
final whoWeAreProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final whyUsProvider = StateProvider<GlobalKey>((ref) => GlobalKey());

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
  GlobalKey key = GlobalKey();


  RenderBox scrollToIndex(GlobalKey key){
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    return box;
  }


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return DeviceListener(
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


                  Consumer(
                    builder: (context, ref, child) {
                      return CustomScrollView(
                        controller: ref.watch(scrollController),
                        physics: const CustomScrollPhysics(),
                        slivers: [

                          const SliverToBoxAdapter(child: HomePageView(),),
                          WhatWeDo(key: ref.watch(whatWeDoProvider),),
                          WhoWeAre(key: ref.watch(whoWeAreProvider),),
                          WhyUs(key: ref.watch(whyUsProvider),),
                          const Footer(),

                        ],
                      );
                    }
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
      ),
    );
  }

}


class DebugBox extends StatelessWidget{
  final Color color;
  final double height, width;
  final String debugLabel;
  const DebugBox({this.color=Colors.blue, this.width=100, this.height=100, this.debugLabel="", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // if(debugLabel=="align")print(debugLabel);
    print(debugLabel);
    return Container(color: color, height: height, width: width,);
  }
}
