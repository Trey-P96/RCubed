import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';


class SmoothScrollMouse extends StatefulWidget{
  final bool isPageView;
  final List<Widget> children;
  final PreloadPageController pageController;
  const SmoothScrollMouse({required this.isPageView, required this.pageController, required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothScrollMouseState();
}

class SmoothScrollMouseState extends State<SmoothScrollMouse>{
  ScrollPhysics physics = const ClampingScrollPhysics();

  // void animateToPage(){
  //   physics = const NeverScrollableScrollPhysics();
  //   widget.pageController.animateToPage(widget.pageController.page!.toInt()+1, duration: const Duration(milliseconds: 700), curve: Curves.easeOutQuart);
  // }

  @override
  void initState(){ //TODO: dispose timer, etc.
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPageView?
    RawScrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      thumbColor: Colors.black87,
      thickness: 10,
      controller: widget.pageController,
      child: PreloadPageView.builder(
          scrollDirection: Axis.vertical,
          preloadPagesCount: 5,
          controller: widget.pageController,
          physics: physics,
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
        physics: const ClampingScrollPhysics(),
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