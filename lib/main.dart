import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/smooth_scroll_provider.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page.dart';

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
        ChangeNotifierProvider(create: (_)=>PageHandler()),
        ChangeNotifierProvider(create: (_)=>AbsorbInput()),
        ChangeNotifierProvider(create: (_)=>SmoothScroll()),
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
      home: HomePage(),

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
  Map<String, int> indexMap = {};
  PageController pageController = PageController();
  void updateIndex(String instance, int i){
      indexMap.putIfAbsent(instance, () => i);
      indexMap.update(instance, (value) => i);
      //print(indexMap);
      notifyListeners();
  }

  double getIndex(String instance){
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

class PageHandler extends ChangeNotifier{

  Map<String, double> _indexMap = {};
  Map<int, String> _pages = {};
  Map<String, String> _relatives = {}; // (child, parent)
  Map<String, bool> _viewPort = {};
  String _activePage = "";
  ScrollPhysics _scrollPhysics = AlwaysScrollableScrollPhysics();
  ScrollPhysics scsvPhysics = ClampingScrollPhysics();
  bool _snapping = false;
  int _currentPage = 0;
  bool _absorbing = false;

  void updateIndex(String instance, double i){
    _indexMap.putIfAbsent(instance, () => i);
    _indexMap.update(instance, (value) => i);
    notifyListeners();
  }

  double getIndex(String parent){
    if(_indexMap.containsKey(parent)){
      return _indexMap[parent] as double;
    }
    else{
      return 0;
    }
  }

  void setPage(String description, int pageNumber){
    _pages.putIfAbsent(pageNumber, () => description);
    _pages.update(pageNumber, (value) => description);
    //notifyListeners();
  }

  String getPage(int page){
    if(_pages.containsKey(page)){
      return _pages[page] as String;
    }
    else{
      return "";
    }
  }

  void setRelatives(String child, String parent){
    _relatives.putIfAbsent(child, () => parent);
    _relatives.update(child, (value) => parent);
    notifyListeners();
  }

  String getParent(String child){
    if(_relatives.containsKey(child)){
      return _relatives[child] as String;
    }
    else{
      return "";
    }
  }

  void updateViewPort(String child, bool active){
    _viewPort.putIfAbsent(child, () => active);
    _viewPort.update(child, (value) => active);
    notifyListeners();
  }

  void updateActivePage(String page){
    _activePage = page;
    notifyListeners();
  }

  void updatePhysics(ScrollPhysics scrollPhysics){
    _scrollPhysics = scrollPhysics;
    notifyListeners();
  }

  ScrollPhysics getPhysics(){
    return _scrollPhysics;
  }

  void updateSnapping(bool snapping){
    _snapping = snapping;
    notifyListeners();
  }

  bool getSnap(){
    return _snapping;
  }

  void updatePage(int page){
    _currentPage = page;
    notifyListeners();
  }

  int currentPage(){
    return _currentPage;
  }

  void setScsvPhysics(ScrollPhysics scrollPhysics){
    scsvPhysics = scrollPhysics;
    notifyListeners();
  }

  ScrollPhysics getScsvPhysics(){
    return scsvPhysics;
  }

  void setAbsorb(bool absorbing){
    _absorbing = absorbing;
    notifyListeners();
  }

  bool isAbsorbing(){
    return _absorbing;
  }

}

class AbsorbInput extends ChangeNotifier{
  bool _isAbsorbing = false;
  ScrollPhysics _scrollPhysics = ClampingScrollPhysics();
  int scrollDirection = 0;

  void setAbsorb(bool absorb){
    _isAbsorbing = absorb;
    notifyListeners();
  }

  bool isAbsorbing(){
    return _isAbsorbing;
  }

  void setPhysics(ScrollPhysics scrollPhysics){
    _scrollPhysics = scrollPhysics;
    notifyListeners();
  }
  ScrollPhysics getScrollPhysics(){
    return _scrollPhysics;
  }

  void updateScrollDirection(int direction){
    if(scrollDirection != direction){
      scrollDirection = direction;
      setPhysics(ClampingScrollPhysics());
    }
  }
}