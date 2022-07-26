

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/widgets/smooth_scrolling/smooth_scroll_mouse.dart';
import 'package:rcubed/widgets/smooth_scrolling/smooth_scroll_touch.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../scratch.dart';

class SmoothScroll extends StatelessWidget{
  final bool isPageView;
  final List<Widget> children;
  final double maxWidth;
  const SmoothScroll({this.maxWidth=double.infinity, required this.isPageView, required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: (Provider.of<DeviceProvider>(context).isTouch())?

        SmoothScrollTouch(isPageView: isPageView, children: children,)
            :
        SmoothScrollMouse(isPageView: isPageView,
        children: children),
      ),
    );
  }

}