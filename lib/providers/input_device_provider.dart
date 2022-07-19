
import 'dart:ui';
import 'package:flutter/material.dart';

class InputDevice extends ChangeNotifier{
  PointerDeviceKind _device = PointerDeviceKind.touch;

  void updateDevice(PointerDeviceKind device){
    if(_device != device){
      _device = device;
      notifyListeners();
    }
  }

  PointerDeviceKind getDevice() => _device;
}