

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../../../network_images/network_images.dart';

class WhoWeAre extends StatefulWidget{
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WhoWeAreState();
  }
}

class WhoWeAreState extends State<WhoWeAre>{
  PreloadPageController controller = PreloadPageController(viewportFraction: 0.75, initialPage: 1);

  List<Widget> list = [
    SizedBox(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(color: RCubedTheme.primary.withOpacity(0.95),child: Center(child: Text("PLACE PROFILE IMAGE HERE:", style: TextStyle(color: Colors.white),)),),
    ),),
    SizedBox(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(color: RCubedTheme.primary.withOpacity(0.95), child: Center(child: Text("PLACE PROFILE IMAGE HERE:", style: TextStyle(color: Colors.white),)),),
    ),),
    SizedBox(child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(color: RCubedTheme.primary.withOpacity(0.95),child: Center(child: Text("PLACE PROFILE IMAGE HERE:", style: TextStyle(color: Colors.white),)),),
    ),),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whoWeAreInfo)),
        Scaffold(
          appBar: AppBar(
            title: Text("Who We Are"),
            backgroundColor: Colors.black.withOpacity(0.8),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Container(
              color: Colors.black.withOpacity(0.7),
              child: PreloadPageView.builder(
                  controller: controller,
                  itemCount: list.length,
                  itemBuilder: (context, index){
                return list[index];
              }),
            ),
          ),
        ),
      ],
    );
  }
}