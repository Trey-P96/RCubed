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
  final SmoothScroll parent;
  final GlobalKey<SmoothScrollTouchState> key;
  const SmoothScrollTouch({required this.children, required this.parent, required this.key}) : super(key: key);
  SmoothScrollTouchState? of(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollTouchState>();
  SmoothScrollState? parentState(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollState>();

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return SmoothScrollTouchState();
  }

}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  PageController controller = PageController();
  ScrollController dummyController = ScrollController();
  GlobalKey<SmoothScrollTouchState> activeChild = GlobalKey<SmoothScrollTouchState>();
  late Timer _timer;
  List<Widget> dummyList = [];
  double initialOffset = 0;
  double minScrollExtent = 0, maxScrollExtent = 0;
  double underScroll = 0, overScroll = 0;
  double dummyOffset = 0, startOffset = 0;
  bool inRange = false;
  bool hasParent = false;
  bool parentHasClients = false;
  bool initiateOverscroll = false;
  bool cancelScroll = false;
  bool isActive = false;
  double opacity = 1;

  @override
  void initState(){
    super.initState();
    if(widget.parent.debugLabel == "inner") opacity = 0;
    initialOffset = widget.parentState(context)!.screenHeight*3;
    minScrollExtent = initialOffset;
    dummyController = ScrollController(initialScrollOffset: initialOffset);

    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      validateParentData();
    });

    dummyController.addListener(() {

      if(controller.hasClients && dummyController.hasClients) {
        maxScrollExtent = minScrollExtent+controller.position.maxScrollExtent;}

      if(dummyController.offset > minScrollExtent && dummyController.offset < maxScrollExtent){
        inRange = true;
        controller.jumpTo(dummyController.offset-initialOffset);}
      else inRange = false;

      handleOverScroll();
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
    createList();

    // TODO: implement build
    return Stack(
      children: [

        Listener(
          onPointerDown: (_){
            cancelScroll = false;
            isActive = true;
            if(activeChild.currentState != null && !activeChild.currentState!.isActive) activeChild.currentState!.cancelScroll = true;

            if(controller.offset+initialOffset != dummyController.offset){
              dummyController.jumpTo(controller.offset+initialOffset);
            }
          },
          onPointerUp: (_){
            if(hasParent) widget.of(context)!.activeChild = widget.key;
            isActive = false;
          },
          child: Opacity(
            opacity: 0,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: dummyController,
                itemCount: dummyList.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i){
                  return AbsorbPointer(child: dummyList[i]);
                }
            ),
          ),
        ),

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
  void createList(){
    dummyList.clear();
    dummyList.add(OverScrollItem(
      child: SizedBox(
        height: initialOffset,
      ),
    ));
    dummyList.addAll(widget.children);
    dummyList.add(OverScrollItem(
      child: SizedBox(
        height: initialOffset,
      ),
    ));
  }

  void handleOverScroll(){
    overScroll = max(dummyController.offset-maxScrollExtent, 0);
    underScroll = min(dummyController.offset-minScrollExtent, 0);

    if(overScroll > 0 && parentHasClients){
      if(!initiateOverscroll) startOffset = widget.of(context)!.controller.offset;
      initiateOverscroll = true;
      if(!cancelScroll) widget.of(context)!.jumpToOverscroll(startOffset+overScroll);
    }
    else if(underScroll < 0 && parentHasClients){
      if(!initiateOverscroll) startOffset = widget.of(context)!.controller.offset;
      initiateOverscroll = true;

      if(!cancelScroll){
        // widget.of(context)!.jumpToOverscroll(startOffset+underScroll);
        widget.of(context)!.jumpToUnderScroll(startOffset+underScroll);
      }

    } else{
      initiateOverscroll = false;

    }

    //print("${widget.parent.debugLabel} : $startOffset");
  }

  void validateParentData(){
    if(widget.of(context) != null) hasParent = true;
    if(hasParent && widget.of(context)!.controller.hasClients) parentHasClients = true;
    if(hasParent && parentHasClients && inRange){
      startOffset = widget.of(context)!.controller.offset;
    }
  }

  void jumpToOverscroll(double offset){
    controller.jumpTo(min(offset, controller.position.maxScrollExtent));
  }

  void jumpToUnderScroll(double offset){
    controller.jumpTo(max(offset, controller.position.minScrollExtent));
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