

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';

class RCubed extends StatefulWidget{
  const RCubed({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RCubedState();
  }

}

class RCubedState extends State<RCubed>{
  List<Widget> widgets = [Logo(), Logo()];
  final PageController _pageController = PageController();
  ScrollPhysics scrollPhysics = ClampingScrollPhysics();
  bool isAbsorbing = false;

  @override
  Widget build(BuildContext context) {

    _pageController.addListener(() {
      if(_pageController.offset == _pageController.position.maxScrollExtent){
        //Provider.of<PageHandler>(context, listen: false).setScsvPhysics(NeverScrollableScrollPhysics());
        // setState((){
        //   scrollPhysics = NeverScrollableScrollPhysics();
        // });
      }
    });
    // TODO: implement build
    return GestureDetector(
      onVerticalDragUpdate: (drag){
        print(drag.delta.dy);
        if(_pageController.offset == _pageController.position.maxScrollExtent && drag.delta.dy < 0){
          Provider.of<PageHandler>(context,listen: false).setAbsorb(true);
          setState((){
            isAbsorbing = true;
          });
        }
        else if(_pageController.offset == _pageController.position.minScrollExtent && drag.delta.dy > 0){
          Provider.of<PageHandler>(context, listen: false).setAbsorb(true);
          setState((){
            isAbsorbing = true;
          });
        }
        else{
          Provider.of<PageHandler>(context, listen: false).setAbsorb(false);
          setState((){
            isAbsorbing = false;
          });
        }
      },
      child: AbsorbPointer(
        absorbing: isAbsorbing,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          controller: _pageController,
          child: Column(
            children: [
              Logo(),
              Logo(),
              Logo(),
              Logo(),
              Logo(),
            ],
          ),
        ),
      ),
    );
  }
}
