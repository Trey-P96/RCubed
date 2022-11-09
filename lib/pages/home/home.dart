import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/sub_pages/home_logo/home_logo.dart';
import 'package:rcubed/pages/home/sub_pages/what_we_do/what_we_do.dart';
import 'package:rcubed/pages/home/sub_pages/who_we_are/who_we_are.dart';
import 'package:rcubed/pages/home/sub_pages/why_us/why_us.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../custom_scroll_physics/custom_scroll_physics.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/device_listener/device_listener.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/nav_bar/nav_list.dart';
import 'sub_pages/footer/footer.dart';

final StateProvider<ScrollController> scrollController = StateProvider((ref) => ScrollController());
final navBarProvider = StateProvider<GlobalKey<ScaffoldState>>((ref) => GlobalKey());
final homePageProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final whatWeDoProvider = StateProvider<GlobalKey>((ref)=>GlobalKey());
final whoWeAreProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final whyUsProvider = StateProvider<GlobalKey>((ref) => GlobalKey());
final userIsScrolling = StateProvider<bool>((ref) => false);

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
  static double maxWidth = 1400;


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
            child: Stack(
              children: [

                Align(
                  child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
                ),

                Consumer(
                  builder: (context, ref, child) {
                    return NotificationListener(
                      onNotification: (notification){
                        if(notification is ScrollStartNotification){
                          ref.read(userIsScrolling.state).state = true;
                        }
                        else if(notification is ScrollEndNotification){
                          ref.read(userIsScrolling.state).state = false;
                        }
                        return false;
                      },
                      child: CustomScrollView(
                        controller: ref.watch(scrollController),
                        physics: const CustomScrollPhysics(),
                        slivers: [

                          SliverCrossAxisConstrained(
                            maxCrossAxisExtent: maxWidth,
                            child: MultiSliver(
                              children: [
                                const SliverToBoxAdapter(child: HomeLogo(),),
                                WhatWeDo(key: ref.watch(whatWeDoProvider),),
                                WhoWeAre(key: ref.watch(whoWeAreProvider),),
                                WhyUs(key: ref.watch(whyUsProvider),),
                                const Footer(),
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  }
                ),

              ],
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