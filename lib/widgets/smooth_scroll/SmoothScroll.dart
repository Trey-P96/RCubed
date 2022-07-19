

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/widgets/smooth_scroll/smooth_list_scroll_mouse.dart';
import 'package:rcubed/widgets/smooth_scroll/smooth_list_scroll_touch.dart';

import '../../providers/input_device_provider.dart';

class SmoothScroll extends StatefulWidget{
  final List<Widget> children;
  const SmoothScroll({required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollState();
  }
}

class SmoothScrollState extends State<SmoothScroll>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Provider.of<InputDevice>(context).getDevice() == PointerDeviceKind.touch ?
              SmoothScrollTouch(children: widget.children, parent: this.widget,):
              SmoothScrollMouse(children: widget.children, parent: this.widget,));
  }
}


//if(condition)...[widgets],