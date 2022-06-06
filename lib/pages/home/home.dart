import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/physics/spring_simulation.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/navigation_bar/nav_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../themes/theme.dart';

class HomePage extends StatelessWidget {
  final controller = ScrollController();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const String logoPath = 'assets/images/RcubedLogo.svg';
    // final Widget logo = SvgPicture.asset(
    //   logoPath,
    //   color: MyTheme().primary,
    //   width: 200,
    // );
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(),
            physics: AlwaysScrollableScrollPhysics(),
            child: Text(HomeContent().diem),
          ),
        ),
      ],
    );
  }
}


class Handler extends StatelessWidget{

  final ScrollController controller;
  List<double> q = [];
  final Widget child;
  var scrollPhysics = ScrollPhysics();
  double velocity = 0;

  Handler(this.controller, this.child,{Key? key}) : super(key: key){
    _start();
  }
  
  void _start(){
    // Timer.periodic(Duration(milliseconds: 250), (timer) {
    //   if(controller.hasClients){
    //     velocity = controller.offset-initial;
    //     initial = controller.offset;
    //   }
    // });
    controller.addListener(() {
      double maxBoundary = controller.position.maxScrollExtent;
      double minBoundary = controller.position.minScrollExtent;
      if(controller.offset > maxBoundary){
        controller.jumpTo(controller.position.maxScrollExtent);
      }
      if(controller.offset < minBoundary){
        controller.jumpTo(controller.position.minScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      onPointerUp: (details){

      },
      onPointerMove: (details){
        if(!controller.position.outOfRange){
          controller.jumpTo(controller.offset-details.delta.dy);
        }
      },
      onPointerSignal: (ps){
        if (ps is PointerScrollEvent) {
          q.add(ps.scrollDelta.dy.abs());
          if(q.length > 10) q.removeRange(3, q.length-1);
          if(q.average != ps.scrollDelta.dy.abs() && !controller.position.outOfRange) {
            controller.jumpTo(controller.offset+ps.scrollDelta.dy);
          } else {
            controller.animateTo(controller.offset+ps.scrollDelta.dy, duration: const Duration(milliseconds: 175), curve: Curves.linearToEaseOut);
          }
        }
      },
      child: GestureDetector(
        onPanStart: (details){

        },
        onPanEnd: (details){
          double velocity = details.velocity.pixelsPerSecond.dy/5;
          controller.animateTo(controller.offset-velocity, duration: Duration(milliseconds: 800), curve: Curves.decelerate);
        },
        child: child,
      ),
    );
  }
  
}





