import 'dart:ui';
import 'package:flutter/cupertino.dart';

class SmoothScroll extends ChangeNotifier{
  Map<StatefulWidget, ScrollPhysics> _physicsMap = {};
  Map<StatefulWidget, PointerDeviceKind> _deviceMap = {};
  Map<StatefulWidget, double> _controllerOffsetMap = {};

  void updatePhysics(StatefulWidget widget, ScrollPhysics scrollPhysics){
    _physicsMap.putIfAbsent(widget, () => scrollPhysics);
    _physicsMap.update(widget, (value) => scrollPhysics);
    notifyListeners();
  }

  void updateDevice(StatefulWidget widget, PointerDeviceKind device){
    _deviceMap.putIfAbsent(widget, () => device);
    _deviceMap.update(widget, (value) => device);
    if(device == PointerDeviceKind.touch) updatePhysics(widget, ClampingScrollPhysics());
    else updatePhysics(widget, NeverScrollableScrollPhysics());
    notifyListeners();
  }

  void updateOffset(StatefulWidget widget, double offset){
    _controllerOffsetMap.putIfAbsent(widget, () => offset);
    _controllerOffsetMap.update(widget, (value) => offset);
  }

  ScrollPhysics getPhysics(StatefulWidget widget){
    if(_physicsMap.containsKey(widget)) return _physicsMap[widget]!;
    else return ClampingScrollPhysics();
  }

  PointerDeviceKind getDevice(StatefulWidget widget){
    if(_deviceMap.containsKey(widget)) return _deviceMap[widget]!;
    else return PointerDeviceKind.touch;
  }

  double getOffset(StatefulWidget widget){
    if(_controllerOffsetMap.containsKey(widget)) return _controllerOffsetMap[widget]!;
    else return 0;
  }
}