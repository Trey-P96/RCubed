import 'dart:ui';
import 'package:collection/collection.dart';
import 'dart:math';
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
    // controller.addListener(() {
    //   double overscroll = 250;
    //
    //
    //   if(controller.offset > controller.position.maxScrollExtent + overscroll){
    //     controller.position.activity!.delegate.goIdle();
    //     controller.position.activity!.resetActivity();
    //     controller.position.jumpTo(controller.position.maxScrollExtent+overscroll);
    //   }
    //   if(controller.offset < controller.position.minScrollExtent -overscroll){
    //     controller.position.activity!.delegate.goIdle();
    //     controller.position.activity!.resetActivity();
    //     controller.position.jumpTo(controller.position.minScrollExtent-overscroll);
    //   }
    // });


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
              if(!controller.position.outOfRange){
                controller.jumpTo(controller.offset+(-details.delta.dy));
              }

            },
            onPointerUp: (details){
            },
            onPointerSignal: (ps) {
              if (ps is PointerScrollEvent) {
                q.add(ps.scrollDelta.dy.abs());
                if(q.length > 10) q.removeRange(3, q.length-1);
                if(q.average != ps.scrollDelta.dy.abs()) controller.jumpTo(controller.offset+ps.scrollDelta.dy);
                else controller.animateTo(controller.offset+ps.scrollDelta.dy, duration: Duration(milliseconds: 250), curve: Curves.linearToEaseOut);
              }
            },
            child: GestureDetector(
              onPanEnd: (details){
                double velocity = details.velocity.pixelsPerSecond.dy/10;
                controller.animateTo(controller.offset-velocity, duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
              },
              child: SingleChildScrollView(
                controller: controller,
                physics: ClampingScrollPhysics().applyTo(NeverScrollableScrollPhysics()),
                // physics: CustomScrollPhysics(parent: NeverScrollableScrollPhysics()),
                child: Text(HomeContent().diem),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({required ScrollPhysics parent})
      : super(parent: parent);

  @override
  double get minFlingVelocity => 100;

  @override
  double get maxFlingVelocity => 100;

  @override
  double get minFlingDistance => double.infinity;

  @override
  double carriedMomentum(double existingVelocity) {
    if (parent == null)
      return 0.0;
    return parent!.carriedMomentum(existingVelocity);
  }

  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if (parent == null)
      return null;
    return parent!.createBallisticSimulation(position, velocity);
  }

}




