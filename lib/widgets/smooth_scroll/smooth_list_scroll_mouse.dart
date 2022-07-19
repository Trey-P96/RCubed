import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:rcubed/providers/smooth_scroll_provider.dart';

import 'SmoothScroll.dart';

class SmoothScrollMouse extends StatefulWidget{
  final List<Widget> children;
  final SmoothScroll parent;
  const SmoothScrollMouse({required this.children, required this.parent, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothScrollMouseState();
}

class SmoothScrollMouseState extends State<SmoothScrollMouse>{
  final ScrollController _dummyController = ScrollController();
  late ScrollController _scrollController;
  late Timer _timer;
  late double initialScrollOffset, beginScrollOffset;
  late bool isScrolling;
  List<double> pointerSignalInput = [];
  List<double> pointerSignalInputDelta = [];

  @override
  void initState(){ //TODO: dispose timer, etc.
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: Provider.of<SmoothScrollProvider>(context,listen: false).getOffset(widget.parent));
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if(pointerSignalInput.isEmpty)beginScrollOffset = _scrollController.offset;
      isScrolling = _scrollController.position.activity!.isScrolling;
      disposeList();
    });
  }

  @override
  void dispose(){
    _scrollController.dispose();
    _dummyController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SmoothScrollProvider scrollProvider = Provider.of<SmoothScrollProvider>(context, listen: false);
    PointerDeviceKind currentDevice = Provider.of<SmoothScrollProvider>(context).getDevice(widget.parent);

    _scrollController.addListener(() {scrollProvider.updateOffset(widget.parent, _scrollController.offset);});

    return Listener(
      onPointerHover: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget.parent, device.kind);}
      },
      onPointerDown: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget.parent, device.kind);}
      },
      onPointerSignal: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget.parent, device.kind);}

        if(device is PointerScrollEvent){
          pointerSignalInputDelta.add(device.scrollDelta.dy.abs());
          pointerSignalInput.add(device.scrollDelta.dy);

          if(isTrackPad(device)){
            jumpTo(_scrollController.offset + device.scrollDelta.dy);
            _dummyController.jumpTo(_scrollController.offset);
          }
          else{ // device is mouse scrollwheel
            _scrollController.animateTo(beginScrollOffset+pointerSignalInput.sum, duration: Duration(milliseconds: 300), curve: Curves.easeOutQuart);
            _dummyController.jumpTo(_scrollController.offset);
          }
        }
      },
      child: Stack(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              physics: Provider.of<SmoothScrollProvider>(context).getPhysics(widget.parent),
              itemCount: widget.children.length,
              itemBuilder: (ctx, i){
                return widget.children[i];
              }),
          Visibility(
            visible: false,
            maintainState: true,
            maintainSize: true,
            maintainSemantics: true,
            maintainInteractivity: true,
            maintainAnimation: true,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: _dummyController,
                physics: ClampingScrollPhysics(),
                itemCount: widget.children.length,
                itemBuilder: (ctx, i){
                  return widget.children[i];
                }),
          ),
        ],
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
    if(pointerSignalInputDelta.length > 10){
      pointerSignalInputDelta.removeRange(0, 9);
    }
    if (!isScrolling && pointerSignalInput.isNotEmpty) {
      pointerSignalInput.clear();
    }
  }
// -----------------------------------------------------------------------

}

