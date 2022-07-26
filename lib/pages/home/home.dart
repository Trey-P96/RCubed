import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../scratch.dart';
import '../../widgets/background/background.dart';
import '../../widgets/nav_bar/nav_bar.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Background(path: "assets/images/background.png",),
        Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 1200,
            ),
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                //controller: PageController(),
                //physics: AlwaysScrollableScrollPhysics(),
                itemCount: Scratch.scratchList.length,
                itemBuilder: (context, index){
              return Scratch.scratchList[index];
            }),
          ),
        )
      ],
    );
  }

}