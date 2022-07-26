
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/themes/theme.dart';

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
        children: [
          _NavBarObject(
            child: InkWell(
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Colors.blue,
                child: SizedBox(
                    height: iconSize,
                    width: iconSize,
                    child: SvgPicture.asset("assets/images/RcubedLogo.svg",
                        color: RCubedTheme.secondary))),
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
        padding: EdgeInsets.only(left: 20, right: 30), child: child,);
  }
  
}