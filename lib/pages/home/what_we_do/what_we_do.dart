
import 'package:flutter/cupertino.dart';

class WhatWeDo extends StatelessWidget{
  final List<Widget> children;
  const WhatWeDo({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        allowImplicitScrolling: true,
        itemCount: children.length,
        itemBuilder: (context, index){
      return children[index];
    });
  }
}