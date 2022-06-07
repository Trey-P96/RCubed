import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import '../../widgets/navigation_bar/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        const AdaptiveScroll(),
      ],
    );
  }
}

class AdaptiveScroll extends StatefulWidget {
  const AdaptiveScroll({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdaptiveScrollState();
  }
}

class AdaptiveScrollState extends State<AdaptiveScroll> {
  final controller = ScrollController();
  ScrollPhysics scrollPhysics = const AlwaysScrollableScrollPhysics();
  PointerDeviceKind device = PointerDeviceKind.touch;
  List<double> q = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Listener(
        onPointerDown: (pointer) {
          if (pointer.kind == PointerDeviceKind.touch &&
              device != pointer.kind) {
            setState(() {
              device = pointer
                  .kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const AlwaysScrollableScrollPhysics();
            });
          }
        },
        onPointerHover: (pointer) {
          if (pointer.kind == PointerDeviceKind.mouse &&
              device != pointer.kind) {
            setState(() {
              device = pointer
                  .kind; // set to avoid extraneous setState calls after device is detected.
              scrollPhysics = const NeverScrollableScrollPhysics();
            });
          }
        },
        onPointerSignal: (ps) {
          if (ps is PointerScrollEvent) {
            q.add(ps.scrollDelta.dy.abs());
            if (q.length > 10) q.removeRange(3, q.length - 1);
            if (q.average != ps.scrollDelta.dy.abs() &&
                !controller.position.outOfRange) {
              controller.jumpTo(controller.offset + ps.scrollDelta.dy);
            } else {
              controller.animateTo(controller.offset + ps.scrollDelta.dy,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutQuart);
            }
          }
        },
        child: ListView.builder(
            controller: controller,
            physics: scrollPhysics,
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (context, i) {
              return const Padding(
                padding: EdgeInsets.all(10),
                child: Logo(200),
              );
            }),
      ),
    );
  }
}
