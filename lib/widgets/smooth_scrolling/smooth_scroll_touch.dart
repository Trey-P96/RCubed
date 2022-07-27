
import 'package:flutter/cupertino.dart';

class SmoothScrollTouch extends StatefulWidget{
  final bool isPageView, isPrimary;
  final List<Widget> children;
  const SmoothScrollTouch({this.isPrimary=true, required this.isPageView, required this.children, Key? key}) : super(key: key);
  SmoothScrollTouchState? parent(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollTouchState>();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollTouchState();
  }
}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  PageController controller = PageController();
  bool isScrollingUp = false;
  bool atMaxRange = false;
  bool atMinRange = false;

  @override
  void initState(){
    super.initState();
    controller.addListener(() {

    });
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (notification){
        if(notification is OverscrollNotification){
          widget.parent(context)?.controller.jumpTo(widget.parent(context)!.controller.offset + notification.overscroll);
        }
        return true;
      },
      child: (widget.isPageView)?
        PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: widget.children.length,
          controller: controller,
          pageSnapping: true,
          itemBuilder: (context, index){
            return widget.children[index];
          }):
      ListView.builder(
          itemCount: widget.children.length,
          controller: controller,
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