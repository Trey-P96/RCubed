
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarProvider extends ChangeNotifier{
  double _height = 0;
  bool _isExpanded = true;
  Color _color = Colors.transparent;

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

  void updateColor(Color color){
    _color = color;
    notifyListeners();
  }

  Color getColor()=>_color;

}