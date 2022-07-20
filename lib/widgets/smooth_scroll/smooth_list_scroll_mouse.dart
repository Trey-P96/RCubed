import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:rcubed/providers/smooth_scroll_provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

import 'SmoothScroll.dart';

class SmoothScrollMouse extends StatefulWidget{
  final List<Widget> children;
  final SmoothScroll parent;
  const SmoothScrollMouse({required this.children, required this.parent, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothScrollMouseState();
}

class SmoothScrollMouseState extends State<SmoothScrollMouse>{
  PageController _dummyController = PageController();
  PageController _scrollController = PageController();
  late Timer _timer;
  double initialScrollOffset=0, beginScrollOffset=0;
  bool isScrolling = false;
  double currentOffset = 0;
  List<double> pointerSignalInput = [];
  List<double> pointerSignalInputDelta = [];
  PointerDeviceKind device = PointerDeviceKind.mouse;

  @override
  void initState(){ //TODO: dispose timer, etc.
    super.initState();
    //SmoothScrollProvider scrollProvider = Provider.of<SmoothScrollProvider>(context, listen: false);
    //_scrollController = PageController(initialScrollOffset: Provider.of<SmoothScrollProvider>(context,listen: false).getOffset(widget.parent));
    // _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
    //   disposeList();
    // });
    _dummyController.addListener(() {
      if(device == PointerDeviceKind.mouse){
        _scrollController.animateTo(_dummyController.offset, duration: Duration(milliseconds: 500), curve: Curves.easeOutQuart);
      }
      else{
        _scrollController.jumpTo(_dummyController.offset);
      }
      disposeList();
    });
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _dummyController.dispose();
    //_timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointer){
        if(pointer is PointerScrollEvent){
          pointerSignalInputDelta.add(pointer.scrollDelta.dy.abs());

          if(isTrackPad(pointer)){
            device = PointerDeviceKind.trackpad;
          } else device = PointerDeviceKind.mouse;
        }
      },
      child: widget.parent.isPageView?
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Opacity(
              opacity: 0,
              child: PageView.builder(
                  controller: _dummyController,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  pageSnapping: false,
                  itemCount: widget.children.length,
                  itemBuilder: (context, i){
                    return AbsorbPointer(child: widget.children[i]);
                  }
              ),
            ),

            TransparentPointer(
              child: PageView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  pageSnapping: false,
                  itemCount: widget.children.length,
                  itemBuilder: (context, i){
                    return widget.children[i];
                  }
              ),
            ),
          ],
        ),
      )
          :
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
          children: [
            Opacity(
              opacity: 0,
              child: ListView.builder(
                  controller: _dummyController,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  itemCount: widget.children.length,
                  itemBuilder: (context, i){
                    return AbsorbPointer(child: widget.children[i]);
                  }
              ),
            ),

            TransparentPointer(
              child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.children.length,
                  itemBuilder: (context, i){
                    return widget.children[i];
                  }
              ),
            ),
          ],
    ),
        ),
    );
  }



// -----------------------------------------------------------------------
//                            Utility Functions
// -----------------------------------------------------------------------

  bool userUpdatedDevice(PointerDeviceKind currentDevice, PointerDeviceKind input){
    return (currentDevice != input);
  }

  bool isTrackPad(PointerScrollEvent input){
    return pointerSignalInputDelta.average != input.scrollDelta.dy.abs();
  }

  void jumpTo(double offset){
    if(offset > _scrollController.position.maxScrollExtent){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
    else if(offset < _scrollController.position.minScrollExtent){
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
    else{
      _scrollController.jumpTo(offset);
    }
  }

  void disposeList(){
    if(pointerSignalInputDelta.length > 5){
      pointerSignalInputDelta.removeRange(0, 4);
    }
  }
// -----------------------------------------------------------------------

}

