import 'dart:ui';
import 'package:collection/collection.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/physics/spring_simulation.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/navigation_bar/nav_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../themes/theme.dart';

class HomePage extends StatelessWidget {
  final controller = ScrollController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyQ q = MyQ();
    List<double> q = [];
    controller.addListener(() {
      double overscroll = 250;
      if(controller.offset > controller.position.maxScrollExtent + overscroll){
        controller.position.activity!.resetActivity();
        controller.jumpTo(controller.position.maxScrollExtent+overscroll);
      }
      if(controller.offset < controller.position.minScrollExtent -overscroll){
        controller.position.activity!.resetActivity();
        controller.jumpTo(controller.position.minScrollExtent-overscroll);
      }
    });
    //print(controller.position.maxScrollExtent);

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
          child: Listener(
            onPointerMove: (details){
              controller.jumpTo(controller.offset+(-details.delta.dy));
            },
            onPointerSignal: (ps) {
              if(ps is PointerScrollEvent){
                controller.position.moveTo(controller.offset+ps.scrollDelta.dy, duration: Duration(milliseconds: 150),curve: Curves.linearToEaseOut, clamp: false);
                controller.position.activity!.resetActivity();
              }

              // if (ps is PointerScrollEvent) {
              //   q.add(ps.scrollDelta.dy.abs());
              //   if(q.length > 10) q.removeRange(3, q.length-1);
              //   if(q.average != ps.scrollDelta.dy.abs()) controller.jumpTo(controller.offset+ps.scrollDelta.dy);
              //   else controller.animateTo(controller.offset+ps.scrollDelta.dy, duration: Duration(milliseconds: 200), curve: Curves.linearToEaseOut);
              // }
            },
            child: SingleChildScrollView(
              controller: controller,
              // physics: NeverScrollableScrollPhysics().applyTo(BouncingScrollPhysics()),
              physics: NeverScrollableScrollPhysics().applyTo(BouncingScrollPhysics()),
              child: Text(HomeContent().diem),
            ),
          ),
        ),
      ],
    );
  }
}




