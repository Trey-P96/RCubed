import 'dart:ui';

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
              if(ps is PointerScrollEvent && ps.kind == PointerDeviceKind.mouse) {
                if(ps.scrollDelta.dy > 0){
                  controller.animateTo(controller.position.pixels + 200,
                    duration: Duration(milliseconds: 600),
                    curve: Curves.linearToEaseOut);
                } else if(ps.kind == PointerDeviceKind.mouse){
                    controller.animateTo(controller.position.pixels - 200,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.linearToEaseOut);
                }
              } else{
                controller.jumpTo(ps.position.dy);
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
