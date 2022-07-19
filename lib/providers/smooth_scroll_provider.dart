import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../widgets/smooth_scroll/SmoothScroll.dart';

class SmoothScrollProvider extends ChangeNotifier{
  Map<SmoothScroll, ScrollPhysics> _physicsMap = {};
  Map<SmoothScroll, PointerDeviceKind> _deviceMap = {};
  Map<SmoothScroll, double> _controllerOffsetMap = {};

  void updatePhysics(SmoothScroll widget, ScrollPhysics scrollPhysics){
    _physicsMap.putIfAbsent(widget, () => scrollPhysics);
    _physicsMap.update(widget, (value) => scrollPhysics);
    notifyListeners();
  }

  void updateDevice(SmoothScroll widget, PointerDeviceKind device){
    _deviceMap.putIfAbsent(widget, () => device);
    _deviceMap.update(widget, (value) => device);
    if(device == PointerDeviceKind.touch) updatePhysics(widget, ClampingScrollPhysics());
    else updatePhysics(widget, NeverScrollableScrollPhysics());
    notifyListeners();
  }

  void updateOffset(SmoothScroll widget, double offset){
    _controllerOffsetMap.putIfAbsent(widget, () => offset);
    _controllerOffsetMap.update(widget, (value) => offset);
  }

  ScrollPhysics getPhysics(SmoothScroll widget){
    if(_physicsMap.containsKey(widget)) return _physicsMap[widget]!;
    else return ClampingScrollPhysics();
  }

  PointerDeviceKind getDevice(SmoothScroll widget){
    if(_deviceMap.containsKey(widget)) return _deviceMap[widget]!;
    else return PointerDeviceKind.touch;
  }

  double getOffset(SmoothScroll widget){
    if(_controllerOffsetMap.containsKey(widget)) return _controllerOffsetMap[widget]!;
    else return 0;
  }
}