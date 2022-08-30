
import 'package:flutter/cupertino.dart';

class AppBarProvider extends ChangeNotifier{
  double _height = 0;

  void updateHeight(double height){
    _height = height;
    notifyListeners();
  }

  double getHeight()=>_height;
}