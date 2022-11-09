

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../rcubed_theme.dart';

class PlatformScrollBar {

  static MaterialStateProperty<double> thickness() {
    switch (defaultTargetPlatform) {
      case (TargetPlatform.linux):
        return const MaterialStatePropertyAll(15);
      case (TargetPlatform.macOS):
        return const MaterialStatePropertyAll(12);
      case (TargetPlatform.windows):
        return const MaterialStatePropertyAll(15);
      default:
        return const MaterialStatePropertyAll(8);
    }
  }

  static Radius radius(){
    switch (defaultTargetPlatform) {
      case (TargetPlatform.linux):
        return const Radius.circular(0);
      case (TargetPlatform.windows):
        return const Radius.circular(0);
      default:
        return const Radius.circular(50);
    }
  }

  static MaterialStateProperty<bool> trackVisibility(){
    switch (defaultTargetPlatform) {
      case (TargetPlatform.linux):
        return const MaterialStatePropertyAll(true);
      case (TargetPlatform.windows):
        return const MaterialStatePropertyAll(true);
      default:
        return const MaterialStatePropertyAll(false);
    }
  }

  static MaterialStateProperty<Color> thumbColor(){
    switch(defaultTargetPlatform){
      case (TargetPlatform.linux):
        return const MaterialStatePropertyAll(Palette.thumbColorWindows);
      case (TargetPlatform.windows):
        return const MaterialStatePropertyAll(Palette.thumbColorWindows);
      default:
        return const MaterialStatePropertyAll(Palette.thumbColor);
    }


  }

  static MaterialStatePropertyAll<Color> trackColor(){
    return MaterialStatePropertyAll(Palette.trackColor.withOpacity(0.8));
  }

  static MaterialStateProperty<bool> thumbVisibility(){
    switch(defaultTargetPlatform){
      case (TargetPlatform.macOS):
        return const MaterialStatePropertyAll(true);
      case (TargetPlatform.linux):
        return const MaterialStatePropertyAll(true);
      case (TargetPlatform.windows):
        return const MaterialStatePropertyAll(true);
      default:
        return const MaterialStatePropertyAll(false);
    }
  }

}