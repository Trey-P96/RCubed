import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class SmoothScrollMouse extends StatefulWidget{
  final bool isPageView;
  final List<Widget> children;
  const SmoothScrollMouse({required this.isPageView, required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothScrollMouseState();
}

class SmoothScrollMouseState extends State<SmoothScrollMouse>{
  PageController pageController = PageController();

  @override
  void initState(){ //TODO: dispose timer, etc.
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPageView?
    RawScrollbar(
      controller: pageController,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: ClampingScrollPhysics(),
          pageSnapping: false,
          itemCount: widget.children.length,
          itemBuilder: (context, i){
            return widget.children[i];
          }
      ),
    )
        :
    ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        itemCount: widget.children.length,
        itemBuilder: (context, i){
          return widget.children[i];
        }
    );
  }



// -----------------------------------------------------------------------
//                            Utility Functions
// -----------------------------------------------------------------------


// -----------------------------------------------------------------------

}