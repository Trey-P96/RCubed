
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../column_builder/column_builder.dart';

class MaterialColumn extends StatelessWidget{
  final List<Widget> children;
  const MaterialColumn({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return CustomScrollView(
      shrinkWrap: true,
      primary: false,
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
        (context, index){return children[index];}, childCount: children.length),),
      ],
    );


    // return ListView.builder(
    //   primary: false,
    //   shrinkWrap: true,
    //   reverse: true,
    //   addRepaintBoundaries: false,
    //   addAutomaticKeepAlives: false,
    //   itemCount: children.length,
    //   itemBuilder: (context, index){
    //     return children[(children.length-1)-index];
    //   },
    // );

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisSize: MainAxisSize.min,
    //   verticalDirection: VerticalDirection.up,
    //   children: [
    //     for(int i=children.length-1; i>=0; i--) children[i],
    //   ],
    // );
  }

}