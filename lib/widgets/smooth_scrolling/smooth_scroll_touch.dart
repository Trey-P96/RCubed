
import 'package:flutter/cupertino.dart';

class SmoothScrollTouch extends StatelessWidget{
  final bool isPageView;
  final List<Widget> children;
  const SmoothScrollTouch({required this.isPageView, required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (isPageView)?
      PageView.builder(
      scrollDirection: Axis.vertical,
        itemCount: children.length,
        pageSnapping: true,
        itemBuilder: (context, index){
          return children[index];
        }):
    ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index){
      return children[index];
    });
  }

}