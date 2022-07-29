import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/info_page.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/widgets/cover_page/cover_page.dart';
import 'package:rcubed/widgets/logo/logo_complete.dart';
import '../../network_images/network_images.dart';
import '../../widgets/background/background.dart';
import '../../widgets/smooth_scrolling/smooth_scrolling.dart';
import '../page.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{
  GlobalKey<SmoothScrollState> key = GlobalKey<SmoothScrollState>();

  @override
  void initState(){
    super.initState();
    Provider.of<PrimaryScrollProvider>(context, listen: false).updateKey(key);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Background(path: Images.background,),
        SmoothScroll(
          key: key,
          isPageView: true,
          maxWidth: 1200,
          children: [
            Container(    // HOME PAGE LOGO
              height: MediaQuery.of(context).size.height-56,
              child: CompleteLogo(),
            ),

            // SmoothScroll(
            //   isPageView: false,
            //   //isPrimary: false,
            //   children:[
            //     Container(
            //       height: MediaQuery.of(context).size.height-56,
            //       child: CompleteLogo(),
            //     ),
            //     Motto(),
            //     BusinessStrategy(),
            //     Container(height: 300,),
            //   ]
            // ),


            NewPage(    // WHAT WE DO
                children: [
              CoverPage(
                backgroundPath: Images.buildings,
                titlePath: "assets/images/what_we_do/what_we_do.svg",),
                  WhatWeDoDetails(),
            ]),


            NewPage(    // WHO WE ARE
                children: [
              CoverPage(
                  titlePath: "assets/images/who_we_are/who_we_are.svg",
                  backgroundPath: Images.whoWeAreCover),
              Container(color: Colors.red,)
            ]),
            
            
            NewPage(    //WHY US
                children: [
                  CoverPage(titlePath: "assets/images/why_us/why_us.svg", backgroundPath: Images.whyUsCover)
                ])


          ],
        ),
      ],
    );
  }

}