

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/providers/who_we_are_providers.dart';
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
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();
  final GlobalKey navBarKey = GlobalKey();

  void scrollToIndex(GlobalKey key){

  }

  void listen(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nestedScrollKey.currentState!.outerController.addListener(() {
        if(nestedScrollKey.currentState!.outerController.offset == 0){
          Provider.of<WhoWeAreProvider>(context, listen: false).updateOpacity(true);
        } else{
          Provider.of<WhoWeAreProvider>(context, listen: false).updateOpacity(false);
        }
      });
    });
  }

  void updateSize(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RenderBox? box = navBarKey.currentContext?.findRenderObject() as RenderBox?;
      if(box != null){
        Provider.of<WhoWeAreProvider>(context, listen: false).updateHeight(box.size.height);
      }

    });
  }

  @override
  void initState(){
    super.initState();
    updateSize();
    listen();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whoWeAreInfo)),
        NestedScrollView(
            key: nestedScrollKey,
            headerSliverBuilder: (context, innerBoxIsScrolled){
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    sliver: SliverAppBar(
                      title: Center(child: Text("Who We Are",style: TextStyle(color: Colors.black, fontSize: 30),)),
                      pinned: true,
                      forceElevated: true,
                      elevation: 5,
                      backgroundColor: Colors.white,
                      actions: [Container()],
                      expandedHeight: Provider.of<WhoWeAreProvider>(context).getHeight(),
                      //expandedHeight: 200,
                      flexibleSpace: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                          child: Align(
                            key: navBarKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: kToolbarHeight+10),
                                  child: Divider(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceEvenly,
                                    children: [
                                      MenuButton(title: "Leadership", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
                                      MenuButton(title: "Values", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView.builder(
                      //controller: ScrollController(),
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

                IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: Provider.of<WhoWeAreProvider>(context).isExpanded()? 1:0,
                    duration: Duration(milliseconds: 400),
                    child: Container(color: Colors.black.withOpacity(0.6),),
                  ),
                ),
              ],
            ),
        ),


      ],
    );
  }
}