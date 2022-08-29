

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

  // int _crossAxisCount(){
  //   double width = MediaQuery.of(context).size.width;
  //
  //   if(width < 500) return 2;
  //   else if(width < 800) return 3;
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whoWeAreInfo)),
        NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled){
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    sliver: SliverAppBar(
                      title: Center(child: Text("Who We Are")),
                      pinned: true,
                      backgroundColor: RCubedTheme.primary,
                      actions: [Container()],
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                  controller: ScrollController(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width <= 500? 1: 2,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Colors.white.withOpacity(0.95)),
                    );
                  }
              ),
            ),
        ),


      ],
    );
  }
}