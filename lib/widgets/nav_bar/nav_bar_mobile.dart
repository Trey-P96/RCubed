import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/providers/scaffold_provider.dart';
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
            child:IconButton(
                  padding: EdgeInsets.zero,
                  mouseCursor: SystemMouseCursors.click,
                  hoverColor: Colors.blue,
                  onPressed: () {
                    Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState!.animateTo(0);
                  },
                iconSize: iconSize,
                  icon: Logo()),
            ),
          Padding(
            padding: EdgeInsets.only(right: outerPadding),
            child: SizedBox(height: iconSize, width: iconSize, child: IconButton(padding: EdgeInsets.zero, onPressed: (){
              Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.openEndDrawer();
            }, icon: Icon(Icons.menu, size: iconSize,),)),
          )
        ],
      ),
    );
  }
}
