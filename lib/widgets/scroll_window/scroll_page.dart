

import 'package:flutter/material.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page_desktop.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScrollPage extends StatelessWidget{
  final double topPadding, bottomPadding;
  final List<Widget> pages;
  final String description;

  ScrollPage({Key? key, required this.description, required this.pages, double this.topPadding=0, double this.bottomPadding=0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenTypeLayout(
      mobile: ScrollPageMobile(pages:pages, description: this.description, topPadding: topPadding, bottomPadding: bottomPadding,),
      desktop: ScrollPageDesktop(pages: pages, description: this.description, topPadding: topPadding, bottomPadding: bottomPadding,),);
  }

}