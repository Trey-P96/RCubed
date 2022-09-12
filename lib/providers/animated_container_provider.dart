
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/expanded_child/expanded_child.dart';



class AnimatedContainerProvider extends ChangeNotifier{
    double? _height;

    void setHeight(double height){
        _height = height;
        //notifyListeners();
    }

    double? getHeight(){
        return _height;
    }
  //
  //   @override
  // void notifyListeners(){
  //       notifyListeners();
  //   }
}