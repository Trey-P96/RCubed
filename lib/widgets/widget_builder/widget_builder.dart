
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyWidget extends StatefulWidget{
  final Widget child;
  const LazyWidget({required this.child, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LazyWidgetState();
  }

}

class LazyWidgetState extends State<LazyWidget>{

  double visibility=0, height=10;
  ValueNotifier<WidgetInfo> notifier = ValueNotifier<WidgetInfo>(WidgetInfo());

  @override
  void initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return VisibilityDetector(
        key: GlobalKey(),
        onVisibilityChanged: (info){
          notifier.value.height=info.visibleBounds.height;
          notifier.value.visibility=info.visibleFraction;
          notifier.notifyListeners();

        },
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, WidgetInfo value, Widget? child) {
            if(value.visibility > 0) {
              return widget.child;
            }

            else {
              return Container(color: Colors.blue, height: value.height,);
            }

          },)
    );
  }

}

class WidgetInfo{
  double visibility=0;
  double height=10;
  WidgetInfo();
}