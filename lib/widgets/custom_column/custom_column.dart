
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialColumn extends StatelessWidget{
  final List<Widget> children;
  const MaterialColumn({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      verticalDirection: VerticalDirection.up,
      children: [
        for(int i=children.length-1; i>=0; i--) children[i],
      ],
    );
  }

}