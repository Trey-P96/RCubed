

import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';

class RCubed extends StatelessWidget{
  RCubed({Key? key}) : super(key: key);
  List<Widget> widgets = [Logo(), Logo()];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    pageController.addListener(() {
      print(pageController.offset);
    });
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Logo(),
          Logo(),
          Logo(),
          Logo(),
          Logo(),
        ],
      ),
    );
  }
}
