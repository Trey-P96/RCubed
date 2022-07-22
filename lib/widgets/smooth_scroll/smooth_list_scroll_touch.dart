import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import '../../providers/smooth_scroll_provider.dart';
import '../../themes/theme.dart';
import 'SmoothScroll.dart';

class SmoothScrollTouch extends StatefulWidget{
  final List<Widget> children;
  final SmoothScroll head;
  final GlobalKey<SmoothScrollTouchState> key;
  const SmoothScrollTouch({required this.children, required this.head, required this.key}) : super(key: key);
  SmoothScrollTouchState? parent(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollTouchState>();
  SmoothScrollState? parentState(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollState>();

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return SmoothScrollTouchState();
  }

}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  PageController controller = PageController();
  PageController dummyController = PageController(initialPage: 10);

  GlobalKey<SmoothScrollTouchState> activeChild = GlobalKey<SmoothScrollTouchState>();
  late Timer _timer;
  List<Widget> dummyList = [];
  double minScrollExtent = 2000, maxScrollExtent = 0;
  double underScroll = 0, overScroll = 0;
  double dummyOffset = 0, startOffset = 0;
  bool inRange = false;
  bool hasParent = false;
  bool parentHasClients = false;
  bool initiateOverscroll = false;
  bool cancelScroll = false;
  bool isActive = false;
  bool initialized = false;
  bool hasClients = false;

  @override
  void initState(){
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      dataListener();
      handleControllers();
    });




      dummyController.addListener(() {

        if(controller.hasClients && dummyController.hasClients) {
          dummyOffset = dummyController.offset-minScrollExtent;
          maxScrollExtent = minScrollExtent+controller.position.maxScrollExtent;}

        if(dummyOffset > controller.position.minScrollExtent && dummyOffset < controller.position.maxScrollExtent){inRange = true;}
        else inRange = false;

        handleOverScroll();
        handleScroll();
      });

  }





  @override
  void dispose(){
    super.dispose();
    controller.dispose();
    dummyController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return (widget.head.isPageView)?

    Stack(
      children: [

        Listener(
          onPointerDown: (_){
            cancelScroll = false;
            isActive = true;
            if(activeChild.currentState != null && !activeChild.currentState!.isActive) activeChild.currentState!.cancelScroll = true;

            if(controller.offset != dummyOffset){
              dummyController.jumpTo(controller.offset+minScrollExtent);
            }
          },
          onPointerUp: (_){
            if(hasParent) widget.parent(context)!.activeChild = widget.key;
            isActive = false;
          },
          child: Opacity(
            opacity: 0,
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: dummyController,
                //itemCount: dummyList.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i){
                  return AbsorbPointer(child: i%2==0?Container(color: Colors.blue,):Container(color: Colors.red,));
                }
            ),
          ),
        ),

        Opacity(
          // opacity: opacity,
          opacity: 1,
          child: TransparentPointer(
            child: PageView.builder(
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                controller: controller,
                itemCount: widget.children.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,i){
                  return widget.children[i];
                }),
          ),
        ),
      ],
    )


        :


    Stack(
      children: [

        Listener(
          onPointerDown: (_){
            cancelScroll = false;
            isActive = true;
            if(activeChild.currentState != null && !activeChild.currentState!.isActive) activeChild.currentState!.cancelScroll = true;

            if(controller.offset != dummyOffset){
              dummyController.jumpTo(controller.offset+minScrollExtent);
            }
          },
          onPointerUp: (_){
            if(hasParent) widget.parent(context)!.activeChild = widget.key;
            isActive = false;
          },
          child: Opacity(
            opacity: 0,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: dummyController,
                //itemCount: dummyList.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i){
                  return Container(height: 500,);
                }
            ),
          ),
        ),
        //
        // ListView.builder(      TESTING WIDGET DO NOT USE
        //   scrollDirection: Axis.vertical,
        //     controller: dummyController,
        //     itemCount: widget.children.length,
        //     physics: ClampingScrollPhysics(),
        //     itemBuilder: (context, index){
        //       return widget.children[index];
        //     }),

        Opacity(
          // opacity: opacity,
          opacity: 1,
          child: TransparentPointer(
            child: ListView.builder(
                controller: controller,
                itemCount: widget.children.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,i){
                  return widget.children[i];
                }),
          ),
        ),
      ],
    );

  }


//---------------------------------------------------------------------------
//                            UTILITY FUNCTIONS
//---------------------------------------------------------------------------

  void handleScroll(){
    if(underScroll < 0) {controller.jumpTo(controller.position.minScrollExtent); }
    else if(overScroll > 0) {controller.jumpTo(controller.position.maxScrollExtent);}
    else {controller.jumpTo(dummyOffset);}
  }

  void handleOverScroll(){
    overScroll = max(dummyOffset-controller.position.maxScrollExtent, 0);
    underScroll = min(dummyOffset, 0);
    if(overScroll > 0 && parentHasClients){
      if(!initiateOverscroll) startOffset = widget.parent(context)!.controller.offset;
      initiateOverscroll = true;
      if(!cancelScroll) widget.parent(context)!.jumpToOverscroll(startOffset+overScroll);
    }
    else if(underScroll < 0 && parentHasClients){
      if(!initiateOverscroll) startOffset = widget.parent(context)!.controller.offset;
      initiateOverscroll = true;

      if(!cancelScroll){
        widget.parent(context)!.jumpToUnderScroll(startOffset+underScroll);
      }

    } else{
      initiateOverscroll = false;
    }
  }

  void dataListener(){
    if(widget.parent(context) != null) hasParent = true;
    else hasParent = false;

    if(hasParent && widget.parent(context)!.hasClients) parentHasClients = true;
    else parentHasClients = false;

    if(controller.hasClients) hasClients = true;
    else hasClients = false;
  }

  void jumpToOverscroll(double offset){
      controller.jumpTo(min(offset, controller.position.maxScrollExtent));
  }

  void jumpToUnderScroll(double offset){
    controller.jumpTo(max(offset, controller.position.minScrollExtent));
  }

  void handleControllers(){
    if(hasClients && !initialized){
      minScrollExtent = dummyController.offset;
      initialized = true;
    }
  }


//---------------------------------------------------------------------------
}

class OverScrollItem extends StatelessWidget{
  final Widget child;
  OverScrollItem({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return child;
  }

}


