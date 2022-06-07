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
  ScrollPhysics scrollPhysics = const AlwaysScrollableScrollPhysics();
  PointerDeviceKind device = PointerDeviceKind.touch;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Listener(
        onPointerDown: (pd){
          if(pd.kind == PointerDeviceKind.touch && device != pd.kind){
            setState((){
              device = pd.kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const AlwaysScrollableScrollPhysics();
            });
          }
        },
        onPointerSignal: (ps){
          if(ps.kind == PointerDeviceKind.mouse && device != ps.kind){
            setState((){
              device = ps.kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const NeverScrollableScrollPhysics();
            });
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