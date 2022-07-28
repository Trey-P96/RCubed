

import 'package:flutter/cupertino.dart';

class WhoWeAre extends StatefulWidget{
  final List<Widget> children;
  const WhoWeAre({required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WhoWeAreState();
  }
}

class WhoWeAreState extends State<WhoWeAre>{

  void animateTo(){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: widget.children.length,
        itemBuilder: (context, index){
          return widget.children[index];
        });
  }
}