
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class Motto extends StatefulWidget{

  const Motto({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MottoState();
  }

}

class MottoState extends State<Motto>{
  Offset position = Offset.zero;
  final _key = GlobalKey();
  late Timer timer;
  double opacity = 0;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      updatePosition();
      if(position.dy > 0 && position.dy < MediaQuery.of(context).size.height * 0.75){
        setState((){opacity = 1;});
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
    timer.cancel();
  }

  void updatePosition() => WidgetsBinding.instance.addPostFrameCallback((_) {
    final RenderBox? box = _key.currentContext?.findRenderObject() as RenderBox?;
    if(box != null) position = box.localToGlobal(Offset.zero);
  });

  @override
  Widget build(BuildContext context) {
    //print(position);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AnimatedOpacity(duration: Duration(milliseconds: 2000),
      curve: Curves.easeOutQuart,
      opacity: opacity,
      child: SvgPicture.asset("assets/images/Motto.svg", key: _key, color: RCubedTheme.primary,)),
    );
  }
}