import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatWeDoDetails extends StatelessWidget {
  const WhatWeDoDetails({Key? key}) : super(key: key);

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
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: ExactAssetImage("assets/images/what_we_do/what_we_do_info.jpg")),
            ),
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
                          color: Colors.green,
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
