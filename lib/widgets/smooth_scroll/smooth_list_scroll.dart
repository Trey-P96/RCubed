

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:rcubed/providers/smooth_scroll_provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

class SmoothListScroll extends StatefulWidget{
  final List<Widget> children;
  const SmoothListScroll({required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SmoothListScrollState();
}

class SmoothListScrollState extends State<SmoothListScroll>{
  final ScrollController _scrollController = ScrollController();
  late double beginScrollOffset;
  late bool isScrolling;
  List<double> pointerSignalInput = [];
  List<double> pointerSignalInputDelta = [];

  SmoothListScrollState(){_start();}

  void _start() { //TODO: dispose timer, etc.
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if(pointerSignalInput.isEmpty)beginScrollOffset = _scrollController.offset;
      isScrolling = _scrollController.position.activity!.isScrolling;
      disposeList();
    });
  }

  @override
  Widget build(BuildContext context) {
    SmoothScroll scrollProvider = Provider.of<SmoothScroll>(context, listen: false);
    PointerDeviceKind currentDevice = Provider.of<SmoothScroll>(context).getDevice(widget);

    return Listener(
      onPointerHover: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget, device.kind);}
      },
      onPointerDown: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget, device.kind);}
      },
      onPointerSignal: (device){ // LISTENING FOR DEVICE TYPE (TOUCH, MOUSE, etc.)
        if(userUpdatedDevice(currentDevice, device.kind)){scrollProvider.updateDevice(widget, device.kind);}

        if(device is PointerScrollEvent){
          pointerSignalInputDelta.add(device.scrollDelta.dy.abs());
          pointerSignalInput.add(device.scrollDelta.dy);

          // if(_scrollController.position.atEdge){
          //   // UPDATE PARENT PHYSICS to alwaysscrollable
          // } else // update parent physics to neverscrollable

          if(isTrackPad(device)){
            _scrollController.jumpTo(_scrollController.offset + device.scrollDelta.dy);
          }
          else{
            _scrollController.animateTo(beginScrollOffset+pointerSignalInput.sum, duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
          }
        }
      },
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          // primary: true,
          // shrinkWrap: true,
          controller: _scrollController,
          physics: Provider.of<SmoothScroll>(context).getPhysics(widget),
          itemCount: widget.children.length,
          itemBuilder: (ctx, i){
            return widget.children[i];
          }),
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

