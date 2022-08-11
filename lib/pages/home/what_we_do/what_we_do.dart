import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_scroll_to_index/easy_scroll_to_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/integration_architecture.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
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

class WhatWeDoState extends State<WhatWeDo> {

  final controller = ItemScrollController();
  final itemListener = ItemPositionsListener.create();

  Future scrollToIndex() async{
    controller.scrollTo(index: 5, duration: Duration(seconds: 1), curve: Curves.ease);

  }

  @override
  void initState(){
    super.initState();
    itemListener.itemPositions.addListener(() {
      // print(itemListener.itemPositions.value);
    });
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
        //Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
        NestedScrollView(
              floatHeaderSlivers: true,
              //controller: itemScrollController as ScrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled){
                return [
                  SliverAppBar(
                    title: Text("What We Do: Enterprise Applications"),
                    pinned: true,
                    //collapsedHeight: 80,
                    expandedHeight: 300,
                    actions: [ElevatedButton(onPressed: (){scrollToIndex();}, child: Text("Press"))],
                    backgroundColor: RCubedTheme.primary,
                  )
                ];
              },
              body: Stack(
                children: [


                  ScrollablePositionedList.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemPositionsListener: itemListener,
                      itemScrollController: controller,
                      itemBuilder: (context, index){
                    return Container(height: 300, child: Text("$index"),);
                  }),

                  TransparentPointer(
                    child: SingleChildScrollView(
                      child: Container(height: MediaQuery.of(context).size.height,),
                    ),
                  ),
                  
                ],
              ),
              ),


      ],
    );

  }
}