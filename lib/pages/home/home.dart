import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/logo/business_strategy.dart';
import 'package:rcubed/widgets/logo/logo_complete.dart';

import '../../widgets/background/background.dart';
import '../../widgets/logo/motto.dart';
import '../../widgets/smooth_scrolling/smooth_scrolling.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> scratchList = [
      Container(height: MediaQuery.of(context).size.height-56, child: Text("CHILD"),),
      Container(height: 400, color: Colors.red,),
      Container(height: 400, color: Colors.orange,),
    ];
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Background(path: "assets/images/background.png",),
        SmoothScroll(
          isPageView: true,
          maxWidth: 1200,
          children: [
            SmoothScroll( // home screen Logo and motto
                isPageView: false,
                children: [
                  Container(height: MediaQuery.of(context).size.height-56, child: CompleteLogo(),),
                  Motto(),
                  BusinessStrategy(),
                  Container(height: 100,),

                ])
          ],
        )
      ],
    );
  }

}