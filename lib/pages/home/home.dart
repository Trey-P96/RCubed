import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import '../../widgets/navigation_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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



class AdaptiveScroll extends StatefulWidget {
  const AdaptiveScroll({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdaptiveScrollState();
  }
}

class AdaptiveScrollState extends State<AdaptiveScroll> {
  final controller = ScrollController();
  ScrollPhysics scrollPhysics = const AlwaysScrollableScrollPhysics();
  PointerDeviceKind device = PointerDeviceKind.touch;
  List<double> q = [];
  List<double> scrollStream = [];
  double start = 0;
  bool isScrolling = false;

  List<MyContainer> myList = [
    MyContainer(300, Colors.blue),
    MyContainer(500, Colors.lightBlue),
    MyContainer(400, Colors.blue),
    MyContainer(300, Colors.lightBlue),
    MyContainer(500, Colors.blue)
  ];

  AdaptiveScrollState(){
    _start();
  }

  void _start(){
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      isScrolling = controller.position.activity!.isScrolling;
      if(!isScrolling && scrollStream.isNotEmpty){
        scrollStream.clear();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Listener(
        onPointerDown: (pointer) {
          if (pointer.kind == PointerDeviceKind.touch &&
              device != pointer.kind) {
            setState(() {
              device = pointer
                  .kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const AlwaysScrollableScrollPhysics();
            });
          }
        },
        onPointerHover: (pointer) {
          if (pointer.kind == PointerDeviceKind.mouse &&
              device != pointer.kind) {
            setState(() {
              device = pointer
                  .kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const NeverScrollableScrollPhysics();
            });
          }

        },
        onPointerSignal: (ps) {
          if (ps is PointerScrollEvent) {
            if(scrollStream.isEmpty){
              start = controller.position.pixels;
            }
            scrollStream.add(ps.scrollDelta.dy);
            q.add(ps.scrollDelta.dy.abs());
            if (q.length > 10) q.removeRange(3, q.length - 1);
            if (q.average != ps.scrollDelta.dy.abs()) {
              controller.jumpTo(controller.offset + ps.scrollDelta.dy);
              if(controller.offset < controller.position.minScrollExtent) controller.jumpTo(controller.position.minScrollExtent);
              if(controller.offset > controller.position.maxScrollExtent) controller.jumpTo(controller.position.maxScrollExtent);
            } else if(!controller.position.outOfRange){
              controller.animateTo(start + scrollStream.sum, duration: const Duration(milliseconds: 800), curve: Curves.easeOutQuart);
            }
          }
        },
        child: ListView.builder(
            controller: controller,
            physics: scrollPhysics,
            shrinkWrap: true,
            itemCount: myList.length,
            itemBuilder: (context, i) {
              return myList[i];
            }),
      ),
    );
  }
}

class MyContainer extends StatelessWidget{
  final Color color;
  final double  height;
  const MyContainer(this.height, this.color,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: color,
      height: height,
    );
  }

}

