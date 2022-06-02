import 'dart:ui';
import 'package:collection/collection.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/navigation_bar/nav_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/theme.dart';

class HomePage extends StatelessWidget {
  final ScrollController controller = ScrollController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MyQ q = MyQ();
    List<double> q = [];
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
            onPointerSignal: (ps) {

              if (ps is PointerScrollEvent) {

                // if(controller.position.activity!.velocity.abs() == 0){
                //   q.clear();
                // }
                // if(controller.offset == controller.position.maxScrollExtent || controller.offset == 0){
                //   q.clear();
                // }
                // if(q.length >= 2 && q[q.length-1].isNaN != q[q.length-2].isNaN){
                //   q.clear();
                // }
                //
                // q.add(ps.scrollDelta.dy);
                controller.animateTo(controller.position.pixels + ps.scrollDelta.dy,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linearToEaseOut);
              }
            },
            child: SingleChildScrollView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              child: Text(HomeContent().diem),
            ),
          ),
        ),
      ],
    );
  }
}

class MyQ {
  List<double> q = [];

  void add(double num) {
    q.add(num);
  }

  double sum() {
    double sum = q.sum;
    return sum;
  }
}
