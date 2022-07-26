import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../scratch.dart';
import '../../widgets/background/background.dart';
import '../../widgets/nav_bar/nav_bar.dart';
import '../../widgets/smooth_scrolling/smooth_scrolling.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Background(path: "assets/images/background.png",),
        SmoothScroll(
          isPageView: true,
          children: Scratch.scratchList,
          maxWidth: 1200,
        )
      ],
    );
  }

}