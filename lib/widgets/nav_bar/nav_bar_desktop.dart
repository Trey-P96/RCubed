
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../logo/logo_simple.dart';

class NavBarDesktop extends StatelessWidget{
  const NavBarDesktop({Key? key}) : super(key: key);
  final double navBarHeight = 60;
  final double iconSize = 40;
  final double outerPadding = 20;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: navBarHeight,
      color: RCubedTheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarObject(
            child: IconButton(
              padding: EdgeInsets.zero,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Colors.blue,
                onPressed: () {  },
                iconSize: iconSize,
                icon: Logo()),
          ),

          _NavBarObject(
            child: InkWell(
              child: Text("What We Do"),
            ),
          ),

          _NavBarObject(
            child: _NavBarObject(
              child: InkWell(
                child: Text("Who We Are"),
              ),
            ),
          ),

          _NavBarObject(
            child: InkWell(
              child: Text("Why Us"),
            ),
          ),

          _NavBarObject(
            child: InkWell(
              child: Text("Careers"),
            ),
          ),

          _NavBarObject(
            child: InkWell(
              child: Text("Contact"),
            ),
          ),

        ],
      ),
    );
  }

}


class _NavBarObject extends StatelessWidget{
  final Widget child;
  const _NavBarObject({required this.child});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: EdgeInsets.only(left:0, right:0), child: child,);
  }
  
}