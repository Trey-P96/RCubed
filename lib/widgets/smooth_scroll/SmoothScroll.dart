

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/widgets/smooth_scroll/smooth_list_scroll_touch.dart';
import 'package:rcubed/widgets/smooth_scroll/smooth_list_scroll_mouse.dart';

import '../../providers/input_device_provider.dart';

class SmoothScroll extends StatefulWidget{
  final String debugLabel;
  final List<Widget> children;
  final bool isPageView;
  SmoothScroll({required this.children, required this.debugLabel, this.isPageView=false, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollState();
  }
}

class SmoothScrollState extends State<SmoothScroll>{
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    // return SmoothScrollMouse(parent: widget,children: widget.children,);
    return (Provider.of<InputDevice>(context).getDevice() == PointerDeviceKind.touch ?
              SmoothScrollTouch(head: widget,children: widget.children, key: GlobalKey<SmoothScrollTouchState>(),):
              SmoothScrollMouse(parent: widget,children: widget.children,));
  }
}


//if(condition)...[widgets],