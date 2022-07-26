import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../logo/logo_simple.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({Key? key}) : super(key: key);
  final double navBarHeight = 60;
  final double iconSize = 40;
  final double outerPadding = 30;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: navBarHeight,
      color: RCubedTheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: outerPadding),
            child: InkWell(
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Colors.blue,
                child: SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: Logo())),
          ),
          Padding(
            padding: EdgeInsets.only(right: outerPadding),
            child: SizedBox(height: iconSize, width: iconSize, child: IconButton(padding: EdgeInsets.zero, onPressed: (){}, icon: Icon(Icons.menu, size: iconSize,),)),
          )
        ],
      ),
    );
  }
}
