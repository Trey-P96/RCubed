
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldProvider extends ChangeNotifier{
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  void updateKey(GlobalKey<ScaffoldState> key){
    _key = key;
    notifyListeners();
  }

  GlobalKey<ScaffoldState> getKey(){
    return _key;
  }
}