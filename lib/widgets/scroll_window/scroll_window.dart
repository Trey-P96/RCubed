

import 'package:flutter/material.dart';
import 'package:rcubed/widgets/scroll_window/scroll_window_desktop.dart';
import 'package:rcubed/widgets/scroll_window/scroll_window_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScrollWindow extends StatelessWidget{
  final double topPadding, bottomPadding;
  final List<Widget> pages;


  ScrollWindow({Key? key, required this.pages, double this.topPadding=0, double this.bottomPadding=0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenTypeLayout(
      mobile: ScrollWindowMobile(pages:pages, topPadding: topPadding, bottomPadding: bottomPadding,),
      desktop: ScrollWindowDesktop(pages: pages, topPadding: topPadding, bottomPadding: bottomPadding,),);
  }

}