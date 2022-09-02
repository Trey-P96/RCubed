import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';
import '../../../network_images/network_images.dart';


class WhatWeDo extends StatelessWidget{
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();

  final enterpriseAppKey = GlobalKey();
  final integrationArchKey = GlobalKey();
  final cloudCompKey = GlobalKey();
  final managedServiceKey = GlobalKey();
  final coSourceKey = GlobalKey();
  final technologyKey = GlobalKey();

  WhatWeDo({Key? key}) : super(key: key);

  void scrollToIndex(GlobalKey key) {
    if(key == enterpriseAppKey){
      nestedScrollKey.currentState!.outerController.position.animateTo(nestedScrollKey.currentState!.outerController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
    else{
      nestedScrollKey.currentState!.innerController.position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), alignment: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
        CustomAppbar(
            title: "What We Do",
            navBarHeightKey: GlobalKey(),
            nestedScrollKey: nestedScrollKey,
            menuButtons: [
              MenuButton(title: "Enterprise Applications", scrollToIndex: scrollToIndex, pageKey: enterpriseAppKey,),
              MenuButton(title: "Integration Architecture", scrollToIndex: scrollToIndex,pageKey: integrationArchKey,),
              MenuButton(title: "Cloud Computing", scrollToIndex: scrollToIndex,pageKey: cloudCompKey,),
              MenuButton(title: "Managed Services", scrollToIndex: scrollToIndex,pageKey: managedServiceKey,),
              MenuButton(title: "Co Sourcing", scrollToIndex: scrollToIndex,pageKey: coSourceKey,),
              MenuButton(title: "Technologies", scrollToIndex: scrollToIndex,pageKey: technologyKey,),
            ],
            body: SingleChildScrollView(
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
        ),
      ],
    );
  }
}