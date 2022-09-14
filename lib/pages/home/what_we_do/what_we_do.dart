import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';
import '../../../network_images/network_images.dart';


class WhatWeDo extends StatelessWidget{
  // final nestedScrollKey = GlobalKey<NestedScrollViewState>();
  //
  // final enterpriseAppKey = GlobalKey();
  // final integrationArchKey = GlobalKey();
  // final cloudCompKey = GlobalKey();
  // final managedServiceKey = GlobalKey();
  // final coSourceKey = GlobalKey();
  // final technologyKey = GlobalKey();

  static const List<Widget> myList = [
    EnterpriseApplications(),
    IntegrationArchitecture(),
    CloudComputing(),
    ManagedServices(),
    CoSourcing(),
    Technologies(),
  ];

  const WhatWeDo({Key? key}) : super(key: key);

  void scrollToIndex(GlobalKey key) {
    // if(key == enterpriseAppKey){
    //   nestedScrollKey.currentState!.outerController.position.animateTo(nestedScrollKey.currentState!.outerController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    // }
    // else{
    //   nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), alignment: 0);
    // }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
        //CachedNetworkImage(fit: BoxFit.cover, imageUrl: "https://github.com/Trey-P96/RCubed/blob/master/assets/images/what_we_do/buildings.jpg?raw=true"),
        //Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: "https://github.com/Trey-P96/RCubed/blob/master/assets/images/what_we_do/buildings.jpg?raw=true")),
        CustomAppbar(
            title: "What We Do",
            navBarHeightKey: GlobalKey(),
            //nestedScrollKey: nestedScrollKey,
            menuButtons: [
              MenuButton(title: "Enterprise Applications", scrollToIndex: scrollToIndex, pageKey: GlobalKey(),),
              MenuButton(title: "Integration Architecture", scrollToIndex: scrollToIndex,pageKey: GlobalKey(),),
              MenuButton(title: "Cloud Computing", scrollToIndex: scrollToIndex,pageKey: GlobalKey(),),
              MenuButton(title: "Managed Services", scrollToIndex: scrollToIndex,pageKey: GlobalKey(),),
              MenuButton(title: "Co Sourcing", scrollToIndex: scrollToIndex,pageKey: GlobalKey(),),
              MenuButton(title: "Technologies", scrollToIndex: scrollToIndex,pageKey: GlobalKey(),),
            ],
            body:
            ListView.builder(
                //physics: const ClampingScrollPhysics(),
                physics: const CustomScrollPhysics(),
                //shrinkWrap: true,
                itemCount: myList.length,
                itemBuilder: (context, index){
                  return myList[index];
                }
            ),
        ),
      ],
    );
  }
}