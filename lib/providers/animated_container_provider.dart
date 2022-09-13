
import 'package:flutter/material.dart';



class AnimatedContainerProvider extends ChangeNotifier{
    bool _isExpanded = false;
    double _opacity = 0;

    void expand(){
        _isExpanded = _isExpanded?false:true;
        notifyListeners();
    }
    bool isExpanded()=>_isExpanded;

    void setOpacity(double opacity){
        _opacity = opacity;
        notifyListeners();
    }

    double getOpacity()=>_opacity;

}