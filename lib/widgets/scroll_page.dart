
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/scroll_window/scroll_window.dart';

class ScrollPage extends StatelessWidget{
  final Widget child;
  const ScrollPage({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(child is ScrollWindow){
      print("check");
    } else{
      print("false");
    }
    return child;
  }

}