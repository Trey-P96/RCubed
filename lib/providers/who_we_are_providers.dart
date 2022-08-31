
import 'package:flutter/cupertino.dart';

class WhoWeAreProvider extends ChangeNotifier{
  double _height = 0;
  bool _isExpanded = true;

  void updateHeight(double height){
    _height = height;
    notifyListeners();
  }

  double getHeight()=> _height;

  void updateOpacity(bool isExpanded){
    _isExpanded = isExpanded;
    notifyListeners();
  }

  bool isExpanded()=>_isExpanded;
}