import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BusinessStrategy extends StatefulWidget{

  const BusinessStrategy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BusinessStrategyState();
  }

}

class BusinessStrategyState extends State<BusinessStrategy>{
  Offset position = Offset.zero;
  final _key = GlobalKey();
  late Timer timer;
  double opacity = 0;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
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

  void updatePosition() => WidgetsBinding.instance!.addPostFrameCallback((_) {
    final RenderBox? box = _key.currentContext?.findRenderObject() as RenderBox?;
    if(box != null) position = box.localToGlobal(Offset.zero);
  });

  @override
  Widget build(BuildContext context) {
    //print(position);
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20, top: 80),
      child: AnimatedOpacity(duration: const Duration(milliseconds: 2000),
          curve: Curves.easeOutQuart,
          opacity: opacity,
          child: SvgPicture.asset("assets/images/businessStrategy.svg", key: _key, color: Colors.black,)),
    );
  }
}