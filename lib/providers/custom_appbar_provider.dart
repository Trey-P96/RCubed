
import 'package:flutter/cupertino.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';

class CustomAppBarProvider extends ChangeNotifier{
  final Map<String, double> _heightMap = {};
  final Map<String, bool> _expandedMap = {};

  void updateHeight(CustomAppbar appbar){
    _heightMap.putIfAbsent(appbar.title, () => 0);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox? box = appbar.navBarHeightKey.currentContext?.findRenderObject() as RenderBox?;
      if(box != null){
        _heightMap.update(appbar.title, (value) => box.size.height);
      }
    });
  }

  double getHeight(CustomAppbar appbar){
    if(_heightMap.containsKey(appbar.title)){
      return _heightMap[appbar.title]!;
    }
    else {
      return 0;
    }
  }

  bool isExpanded(CustomAppbar appbar){
    _expandedMap.putIfAbsent(appbar.title, () => true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(appbar.nestedScrollKey.currentContext!=null){
        _expandedMap.update(appbar.title, (value) => appbar.nestedScrollKey.currentState!.outerController.offset==0);
        notifyListeners();
      }
    });
    return _expandedMap[appbar.title]!;
  }
}