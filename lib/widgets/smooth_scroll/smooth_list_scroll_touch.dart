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
  const SmoothScrollTouch({required this.children, required this.parent, Key? key}) : super(key: key);
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
  List<Widget> dummyList = [];
  double initialOffset = 0;
  double minScrollExtent = 0, maxScrollExtent = 0;
  double underScroll = 0, overScroll = 0;
  double currentOffset = 0, dummyOffset = 0;
  double localMaxScroll = 0;
  bool inRange = false;

  @override
  void initState(){
    super.initState();
    initialOffset = widget.parentState(context)!.screenHeight*3;
    minScrollExtent = initialOffset;
    dummyController = ScrollController(initialScrollOffset: initialOffset);
    //SmoothScrollProvider scrollProvider = Provider.of<SmoothScrollProvider>(context, listen: false);

    dummyController.addListener(() {
      if(dummyController.hasClients) {
        maxScrollExtent = minScrollExtent+controller.position.maxScrollExtent;
        currentOffset = controller.offset;
        dummyOffset = dummyController.offset;
        localMaxScroll = controller.position.maxScrollExtent;
      }

      if(dummyController.offset > minScrollExtent && dummyController.offset < maxScrollExtent){
        inRange = true;
        //if(widget.of(context)?.controller != null && widget.of(context)!.controller.hasClients) beginOffset = widget.of(context)!.controller.offset;
      }
      else {
        inRange = false;
        if(underScroll < 0){
          if(widget.of(context)?.controller.offset != null){
            if(widget.of(context)!.controller.offset > widget.of(context)!.controller.position.minScrollExtent){
              widget.of(context)?.controller.jumpTo(widget.of(context)!.currentOffset+underScroll);
            }
          }
          //widget.of(context)?.dummyController.jumpTo(widget.of(context)!.dummyOffset+underScroll);
        }
        if(overScroll > 0){
          if(widget.of(context)?.controller.offset != null){
            if(widget.of(context)!.controller.offset < widget.of(context)!.controller.position.maxScrollExtent){
              widget.of(context)?.controller.jumpTo(widget.of(context)!.currentOffset+overScroll);
            }
          }


          //print(widget.of(context)!.inRange);
        }
      }

      if(inRange){
        controller.jumpTo(dummyController.offset-initialOffset);
      }

      overScroll = max(dummyController.offset-maxScrollExtent, 0);
      underScroll = min(dummyController.offset-minScrollExtent, 0);

    });
  }



  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createList();

    // TODO: implement build
    return Stack(
      children: [

        Listener(
          onPointerDown: (pointer){
            if(controller.offset+initialOffset != dummyController.offset){
              dummyController.jumpTo(controller.offset+initialOffset);
            }
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

        TransparentPointer(
          child: ListView.builder(
              controller: controller,
              itemCount: widget.children.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,i){
                return widget.children[i];
              }),
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