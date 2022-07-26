
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:transparent_pointer/transparent_pointer.dart';


class SmoothScrollMouse extends StatefulWidget{
  final bool isPageView;
  final List<Widget> children;
  const SmoothScrollMouse({required this.isPageView, required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothScrollMouseState();
}

class SmoothScrollMouseState extends State<SmoothScrollMouse>{
  PageController _dummyController = PageController();
  PageController _scrollController = PageController();
  List<double> _pointerSignalInputDelta = [];
  PointerDeviceKind _device = PointerDeviceKind.mouse;

  @override
  void initState(){ //TODO: dispose timer, etc.
    super.initState();
    _dummyController.addListener(() {
      if(_device == PointerDeviceKind.mouse){
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
          _pointerSignalInputDelta.add(pointer.scrollDelta.dy.abs());

          if(isTrackPad(pointer)){
            _device = PointerDeviceKind.trackpad;
          } else _device = PointerDeviceKind.mouse;
        }
      },
      child: widget.isPageView?
      Stack(
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
      )
          :
      Stack(
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
    );
  }



// -----------------------------------------------------------------------
//                            Utility Functions
// -----------------------------------------------------------------------

  bool userUpdatedDevice(PointerDeviceKind currentDevice, PointerDeviceKind input){
    return (currentDevice != input);
  }

  bool isTrackPad(PointerScrollEvent input){
    return _pointerSignalInputDelta.average != input.scrollDelta.dy.abs();
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
    if(_pointerSignalInputDelta.length > 5){
      _pointerSignalInputDelta.removeRange(0, 3);
    }
  }
// -----------------------------------------------------------------------

}