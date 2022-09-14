import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/pages/home/who_we_are/who_we_are.dart';
import 'package:rcubed/pages/home/why_us/why_us.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/widgets/logo/logo_complete.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/smooth_scrolling/smooth_scrolling.dart';
import 'contact/contact.dart';

class Home extends StatefulWidget{
  final GlobalKey scrollKey;
  const Home({required this.scrollKey, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{
  //GlobalKey<SmoothScrollState> key = GlobalKey<SmoothScrollState>();

  @override
  void initState(){
    super.initState();
    //Provider.of<PrimaryScrollProvider>(context, listen: false).updateKey(key);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ProviderScope(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Background(path: Images.background,),
          SmoothScroll(
            key: widget.scrollKey,
            isPageView: true,
            maxWidth: 1200,
            children: [
              SizedBox(    // HOME PAGE LOGO
                height: MediaQuery.of(context).size.height-56,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    //BackgroundVideo(),
                    CachedNetworkImage(imageUrl: Images.homeLogoBackground, fit: BoxFit.cover,),
                    const CompleteLogo(),
                  ],
                ),
              ),

              const WhatWeDo(),
              WhoWeAre(),
              WhyUs(),
              const Contact(),

              // NewPage(    // WHAT WE DO
              //     children: [
              //   CoverPage(
              //     page: 1,
              //     backgroundPath: Images.buildings,
              //     titlePath: "assets/images/what_we_do/what_we_do.svg",),
              //       WhatWeDo(),
              // ]),


              // NewPage(    // WHO WE ARE
              //     children: [
              //   CoverPage(
              //     page: 2,
              //       titlePath: "assets/images/who_we_are/who_we_are.svg",
              //       backgroundPath: Images.whoWeAreCover),
              //   WhoWeAre(),
              // ]),


              // NewPage(    //WHY US
              //     children: [
              //       CoverPage(
              //           page: 3,
              //           titlePath: "assets/images/why_us/why_us.svg", backgroundPath: Images.whyUsCover)
              //     ])


            ],
          ),
        ],
      ),
    );
  }

}