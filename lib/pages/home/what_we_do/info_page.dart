import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../network_images/network_images.dart';

class WhatWeDoDetails extends StatefulWidget{
  const WhatWeDoDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WhatWeDoDetailsState();
  }
}

class WhatWeDoDetailsState extends State<WhatWeDoDetails> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.8),
        //backgroundColor: Colors.black.withOpacity(0.5),
        title: Text("WHAT WE DO"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              placeholder: (context, url)=>SizedBox(height: 100, width: 100, child: CircularProgressIndicator()),
              fit: BoxFit.cover,
              imageUrl: Images.whatWeDoInfo,),
          ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    ExpansionTile(
                        children: [
                          Container(
                            color: Colors.grey,
                            height: 500,
                          )
                        ],
                        title: Container(
                          height: 100,
                          color: Colors.blue,
                        )),
                    ExpansionTile(
                        children: [
                          Container(
                            color: Colors.grey,
                            height: 500,
                          )
                        ],
                        title: Container(
                          height: 100,
                          color: Colors.blue,
                        )),
                    ExpansionTile(
                        children: [
                          Container(
                            color: Colors.grey,
                            height: 500,
                          )
                        ],
                        title: Container(
                          height: 100,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
