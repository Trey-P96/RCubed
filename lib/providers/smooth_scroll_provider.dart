import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../widgets/smooth_scroll/SmoothScroll.dart';

class SmoothScrollProvider extends ChangeNotifier{
  Map<SmoothScroll, ScrollPhysics> _physicsMap = {};
  Map<SmoothScroll, PointerDeviceKind> _deviceMap = {};
  Map<SmoothScroll, double> _controllerOffsetMap = {};

  void updatePhysics(SmoothScroll key, ScrollPhysics scrollPhysics){
    _physicsMap.putIfAbsent(key, () => scrollPhysics);
    _physicsMap.update(key, (value) => scrollPhysics);
    notifyListeners();
  }

  void updateDevice(SmoothScroll key, PointerDeviceKind device){
    _deviceMap.putIfAbsent(key, () => device);
    _deviceMap.update(key, (value) => device);
    if(device == PointerDeviceKind.touch) updatePhysics(key, ClampingScrollPhysics());
    else updatePhysics(key, NeverScrollableScrollPhysics());
    notifyListeners();
  }

  void updateOffset(SmoothScroll key, double offset){
    _controllerOffsetMap.putIfAbsent(key, () => offset);
    _controllerOffsetMap.update(key, (value) => offset);
  }

  ScrollPhysics getPhysics(SmoothScroll key){
    if(_physicsMap.containsKey(key)) return _physicsMap[key]!;
    else return ClampingScrollPhysics();
  }

  PointerDeviceKind getDevice(SmoothScroll key){
    if(_deviceMap.containsKey(key)) return _deviceMap[key]!;
    else return PointerDeviceKind.touch;
  }

  double getOffset(SmoothScroll key){
    if(_controllerOffsetMap.containsKey(key)) return _controllerOffsetMap[key]!;
    else return 0;
  }
}