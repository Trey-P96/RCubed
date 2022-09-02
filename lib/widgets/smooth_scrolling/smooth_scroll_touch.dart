
import 'package:flutter/cupertino.dart';
import 'package:preload_page_view/preload_page_view.dart';

class SmoothScrollTouch extends StatefulWidget{
  final bool isPageView, isPrimary;
  final List<Widget> children;
  final PreloadPageController pageController;
  const SmoothScrollTouch({required this.pageController, this.isPrimary=true, required this.isPageView, required this.children, Key? key}) : super(key: key);
  SmoothScrollTouchState? parent(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollTouchState>();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollTouchState();
  }
}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  bool isScrollingUp = false;
  bool atMaxRange = false;
  bool atMinRange = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (notification){
        if(notification is OverscrollNotification){
          //widget.parent(context)?.controller.jumpTo(widget.parent(context)!.controller.offset + notification.overscroll);
          widget.parent(context)?.widget.pageController.jumpTo(widget.parent(context)!.widget.pageController.offset + notification.overscroll);
        }
        return true;
      },
      child: (widget.isPageView)?
        PreloadPageView.builder(
        scrollDirection: Axis.vertical,
          preloadPagesCount: 3,
          itemCount: widget.children.length,
          controller: widget.pageController,
          pageSnapping: false,
          itemBuilder: (context, index){
            return widget.children[index];
          }):
      ListView.builder(
          itemCount: widget.children.length,
          controller: widget.pageController,
          physics: ClampingScrollPhysics(),
          //shrinkWrap: true,
          itemBuilder: (context, index){
        return widget.children[index];
      }),
    );
  }

//---------------------------------------------------------------------
//                         UTILITY FUNCTIONS
//---------------------------------------------------------------------



//---------------------------------------------------------------------
}