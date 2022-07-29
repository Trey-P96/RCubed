import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whatWeDoInfo)),
        Scaffold(
          appBar: AppBar(
            title: Text("What We Do"),
            backgroundColor: Colors.black.withOpacity(0.6),
          ),
          backgroundColor: Colors.transparent,
            body:Center(
              child: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Column(
                            children: [
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  textColor: Colors.white,
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Enterprise Applications")),
                                  )),
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Integration Architecture")),
                                  )),
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Cloud Computing")),
                                  )),
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Managed Services")),
                                  )),
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Co-Soucing")),
                                  )),
                              ExpansionTile(
                                  children: [
                                    Container(
                                      color: Colors.transparent,
                                      height: 500,
                                    )
                                  ],
                                  collapsedIconColor: RCubedTheme.primary,
                                  collapsedTextColor: Colors.white,
                                  textColor: Colors.white,
                                  title: Container(
                                    height: 70,
                                    color: RCubedTheme.primary,
                                    child: Center(child: Text("Technologies")),
                                  )),
                            ],
                          ),
                        ),
            )),
      ],
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.black.withOpacity(.8),
    //     //backgroundColor: Colors.black.withOpacity(0.5),
    //     title: Text("WHAT WE DO"),
    //   ),
    //   body: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       ImageNetwork(width: 150, height: 150, image: Images.whatWeDoInfo, imageCache: CachedNetworkImageProvider(Images.whatWeDoInfo),fullScreen: true,),
    //
    //       // Positioned.fill(
    //       //   child: CachedNetworkImage(
    //       //     placeholder: (context, url)=>SizedBox(height: 100, width: 100, child: CircularProgressIndicator()),
    //       //     fit: BoxFit.cover,
    //       //     imageUrl: Images.whatWeDoInfo,),
    //       // ),
    //
    //         Padding(
    //           padding: const EdgeInsets.only(top: 50),
    //           child: SingleChildScrollView(
    //             controller: ScrollController(),
    //             child: Column(
    //               children: [
    //                 ExpansionTile(
    //                     children: [
    //                       Container(
    //                         color: Colors.grey,
    //                         height: 500,
    //                       )
    //                     ],
    //                     title: Container(
    //                       height: 100,
    //                       color: Colors.blue,
    //                     )),
    //                 ExpansionTile(
    //                     children: [
    //                       Container(
    //                         color: Colors.grey,
    //                         height: 500,
    //                       )
    //                     ],
    //                     title: Container(
    //                       height: 100,
    //                       color: Colors.blue,
    //                     )),
    //                 ExpansionTile(
    //                     children: [
    //                       Container(
    //                         color: Colors.grey,
    //                         height: 500,
    //                       )
    //                     ],
    //                     title: Container(
    //                       height: 100,
    //                       color: Colors.red,
    //                     )),
    //               ],
    //             ),
    //           ),
    //         ),
    //     ],
    //   ),
    // );
  }
}
