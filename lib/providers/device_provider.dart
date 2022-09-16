//
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
//
// class DeviceProvider extends ChangeNotifier{
//   PointerDeviceKind _device = PointerDeviceKind.touch;
//
//   void updateDevice(PointerDeviceKind device){
//     _device = device;
//     notifyListeners();
//   }
//
//   PointerDeviceKind getDevice() => _device;
//   bool isTouch() => _device == PointerDeviceKind.touch;
// }