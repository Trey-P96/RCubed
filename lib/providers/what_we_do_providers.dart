
import 'package:flutter/material.dart';

class WhatWeDoProvider extends ChangeNotifier{
  double _height = 0;
  bool _isExpanded = true;
  final Color _color = Colors.transparent;

  void updateHeight(double height){
    _height = height;
    notifyListeners();
  }
  double getHeight()=>_height;


  void updateOpacity(bool isExpanded){
    _isExpanded = isExpanded;
    notifyListeners();
  }

  bool isExpanded()=>_isExpanded;

}