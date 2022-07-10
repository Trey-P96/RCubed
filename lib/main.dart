import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';

void main() {
  // flutter build web --web-renderer canvaskit --release // faster performance
  // Channel master, 3.1.0-0.0.pre.1129 // Dart version 2.18.0

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MyOpacity()),
        ChangeNotifierProvider(create: (_)=>MouseInput()),
        ChangeNotifierProvider(create: (_)=>PageIndex()),
        ChangeNotifierProvider(create: (_)=>IgnoreMouse()),
      ],
      child: MyApp(),
    ),
  );

  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // git test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      scrollBehavior: MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'R-Cubed Consulting',
      theme: ThemeData(
        scaffoldBackgroundColor: MyTheme.secondary,
        fontFamily: 'KumbhSans',
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeDelta: 2,
          fontSizeFactor: 1.1
        )
      ),
      home: Scaffold(
        body: HomePage(),
      ),

    );
  }
}

class IgnoreMouse extends ChangeNotifier{
  bool isActive = false;

  void setValue(bool ignoring){
    isActive = ignoring;
    notifyListeners();
  }

  bool getValue(){
    return isActive;
  }

}

class MyOpacity extends ChangeNotifier{
  Map<MyOpacity, double> opacityMap = {};

  void fadeIn(MyOpacity instance){
    opacityMap.putIfAbsent(instance, () => 1);
    opacityMap.update(instance, (value) => 1);
    notifyListeners();
  }

  void fadeOut(MyOpacity instance){
    opacityMap.putIfAbsent(instance, () => 0);
    opacityMap.update(instance, (value) => 0);
    notifyListeners();
  }

  double getOpacity(MyOpacity instance){
    if(opacityMap.containsKey(instance)) {
      return opacityMap[instance]!;
    }
    else{
      return 0;
    }

  }
}

class MouseInput extends ChangeNotifier{
  bool isMouse = false;

  void set(PointerDeviceKind input){
    if(input == PointerDeviceKind.mouse){
      isMouse = true;
    }
    notifyListeners();
  }
}

class PageIndex extends ChangeNotifier{
  Map<PageIndex, int> indexMap = {};
  PageController pageController = PageController();
  void updateIndex(PageIndex instance, int i){
      indexMap.putIfAbsent(instance, () => i);
      indexMap.update(instance, (value) => i);
      notifyListeners();
  }

  double getIndex(PageIndex instance){
    if(indexMap.containsKey(instance)){
      return indexMap[instance] as double;
    }
    else{
      return 0;
    }
  }

  void updateController(PageController controller){
    pageController = controller;
    //notifyListeners();
  }

}