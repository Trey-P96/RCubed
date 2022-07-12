import 'dart:async';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import 'package:rcubed/widgets/scroll_window/scroll_window.dart';

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
  final controller = PageController();
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
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      isScrolling = controller.position.activity!.isScrolling;
      if (!isScrolling && scrollStream.isNotEmpty) {
        scrollStream.clear();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PageIndex>(context).updateController(controller);
    // TODO: implement build
    return Expanded(
      child: Listener(
        onPointerDown: (pointer) {
          if (pointer.kind == PointerDeviceKind.touch &&
              device != pointer.kind) {
            setState(() {
              device = pointer.kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const AlwaysScrollableScrollPhysics();
            });
          }
        },
        onPointerHover: (pointer) {
          Provider.of<MouseInput>(context, listen: false).set(pointer.kind);
          if (pointer.kind == PointerDeviceKind.mouse &&
              device != pointer.kind) {
            setState(() {
              device = pointer
                  .kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const NeverScrollableScrollPhysics();
            });
          }
        },
        onPointerSignal: (ps){
          if (ps is PointerScrollEvent) {
            if (scrollStream.isEmpty) {
              start = controller.position.pixels;
            }
            scrollStream.add(ps.scrollDelta.dy);
            q.add(ps.scrollDelta.dy.abs());
            if (q.length > 10) q.removeRange(3, q.length - 1);
            if (q.average != ps.scrollDelta.dy.abs()) {
              controller.jumpTo(controller.offset + ps.scrollDelta.dy);
              if (controller.offset < controller.position.minScrollExtent) {
                controller.jumpTo(controller.position.minScrollExtent);
              }
              if (controller.offset > controller.position.maxScrollExtent) {
                controller.jumpTo(controller.position.maxScrollExtent);
              }
            } else if (!controller.position.outOfRange) {
              if(!isScrolling && ps.scrollDelta.dy>0){
                controller.animateToPage(controller.page!+1 as int, duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
              } else if(!isScrolling && ps.scrollDelta.dy<0){
                controller.animateToPage(controller.page!-1 as int, duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
              }

              // controller.animateTo(start + scrollStream.sum,
              //     duration: const Duration(milliseconds: 800),
              //     curve: Curves.easeOutQuart);
            }
          }
        },
        child: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: controller,
            physics: scrollPhysics,
            itemCount: widget.widgetList.length,
            itemBuilder: (context, i) {
              return widget.widgetList[i];
            }),
      ),
    );
  }
}