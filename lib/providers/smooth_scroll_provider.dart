import 'dart:ui';
import 'package:flutter/cupertino.dart';

class SmoothScroll extends ChangeNotifier{
  Map<StatefulWidget, ScrollPhysics> _physicsMap = {};
  Map<StatefulWidget, PointerDeviceKind> _deviceMap = {};
  late StatefulWidget _activeScrollView;

  void updatePhysics(StatefulWidget widget, ScrollPhysics scrollPhysics){
    _physicsMap.putIfAbsent(widget, () => scrollPhysics);
    _physicsMap.update(widget, (value) => scrollPhysics);
    notifyListeners();
  }

  void updateDevice(StatefulWidget widget, PointerDeviceKind device){
    _deviceMap.putIfAbsent(widget, () => device);
    _deviceMap.update(widget, (value) => device);
    _activeScrollView = widget;
    if(device == PointerDeviceKind.touch) updatePhysics(widget, AlwaysScrollableScrollPhysics());
    else updatePhysics(widget, NeverScrollableScrollPhysics());
    notifyListeners();
  }

  ScrollPhysics getPhysics(StatefulWidget widget){
    if(_physicsMap.containsKey(widget)) return _physicsMap[widget]!;
    else return AlwaysScrollableScrollPhysics();
  }

  PointerDeviceKind getDevice(StatefulWidget widget){
    if(_deviceMap.containsKey(widget)) return _deviceMap[widget]!;
    else return PointerDeviceKind.touch;
  }

  StatefulWidget getActiveScrollView(){
    return _activeScrollView;
  }
}