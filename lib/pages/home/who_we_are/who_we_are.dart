

import 'package:flutter/cupertino.dart';

class WhoWeAre extends StatelessWidget{
  final List<Widget> children;
  const WhoWeAre({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: children.length,
        itemBuilder: (context, index){
          return children[index];
        });
  }
}