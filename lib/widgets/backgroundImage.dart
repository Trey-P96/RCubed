
import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const Positioned.fill(
      child: Image(
        //colorBlendMode: BlendMode.modulate,
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }

}