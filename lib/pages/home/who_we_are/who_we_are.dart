

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';

import '../../../network_images/network_images.dart';
import '../../../themes/rcubed_theme.dart';

class WhoWeAre extends StatelessWidget{
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();

  WhoWeAre({Key? key}) : super(key: key);

  void scrollToIndex(GlobalKey key){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [RCubedTheme.primary.withOpacity(0.5),Palette.offWhite, ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        //Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whoWeAreInfo)),
        CustomAppbar(
            title: "Who We Are",
            navBarHeightKey: GlobalKey(),
            nestedScrollKey: nestedScrollKey,
            menuButtons: [
              MenuButton(title: "Leadership", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
              MenuButton(title: "Values", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
            ],
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                //controller: ScrollController(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width <= 500? 1: 2,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(elevation: 5,),
                    );
                  }
              ),
            ),
        ),
      ],
    );
  }
}