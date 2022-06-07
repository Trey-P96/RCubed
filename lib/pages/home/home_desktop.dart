import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import '../../widgets/navigation_bar/nav_bar.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        const AdaptiveScroll(),
      ],
    );
  }
}

class AdaptiveScroll extends StatefulWidget{
  const AdaptiveScroll({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdaptiveScrollState();
  }
}

class AdaptiveScrollState extends State<AdaptiveScroll>{
  ScrollPhysics scrollPhysics = NeverScrollableScrollPhysics();
  PointerDeviceKind device = PointerDeviceKind.touch;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Listener(
        onPointerSignal: (ps){

          if(ps.kind != device){
            switch(ps.kind){
              case PointerDeviceKind.mouse:
                setState((){
                  device = ps.kind;
                  scrollPhysics = NeverScrollableScrollPhysics();
                });
                break;
              default:
                setState((){
                  device = ps.kind;
                  scrollPhysics = AlwaysScrollableScrollPhysics();
                });
                break;
            }
          }

        },
        child: ListView.builder(
            controller: ScrollController(),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (context, i) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: Logo(200),
              );
            }),
      ),
    );
  }

}