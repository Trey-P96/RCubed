import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';

import '../main.dart';

class AdaptiveScroll extends StatefulWidget {
  const AdaptiveScroll(this.widgetList, {Key? key}) : super(key: key);
  final List<Widget> widgetList;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdaptiveScrollState();
  }
}

class AdaptiveScrollState extends State<AdaptiveScroll> {
  final controller = ItemScrollController();
  ScrollPhysics scrollPhysics = const AlwaysScrollableScrollPhysics();
  PointerDeviceKind device = PointerDeviceKind.touch;
  List<double> q = [];
  List<double> scrollStream = [];
  double start = 0;
  bool isScrolling = false;

  AdaptiveScrollState() {
    _start();
  }

  void _start() {
    // Timer.periodic(const Duration(milliseconds: 1), (timer) {
    //   isScrolling = controller.position.activity!.isScrolling;
    //   if (!isScrolling && scrollStream.isNotEmpty) {
    //     scrollStream.clear();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: ScrollablePositionedList.builder(

        //prototypeItem: Text(''),

          scrollDirection: Axis.vertical,
          itemScrollController: controller,
          physics: scrollPhysics,
          itemCount: widget.widgetList.length,
          itemBuilder: (context, i) {
            return widget.widgetList[i];
          }),
    );
  }
}