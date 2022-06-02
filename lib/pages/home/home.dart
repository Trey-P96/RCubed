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
            onPointerMove: (details){
              print(details.position.dy);
              controller.jumpTo(controller.offset+(-details.delta.dy));
            },
            onPointerSignal: (ps) {

              if (ps is PointerScrollEvent) {
                q.add(ps.scrollDelta.dy.abs());
                if(q.length > 10) q.removeRange(3, q.length-1);
                if(q.average != ps.scrollDelta.dy.abs()) controller.jumpTo(controller.offset+ps.scrollDelta.dy);
                else controller.animateTo(controller.offset+ps.scrollDelta.dy, duration: Duration(milliseconds: 200), curve: Curves.linearToEaseOut);
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

