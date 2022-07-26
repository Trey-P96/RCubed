import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/background/background.dart';
import '../../widgets/nav_bar/nav_bar.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Background(path: "assets/images/background.png",),
      ],
    );
  }

}