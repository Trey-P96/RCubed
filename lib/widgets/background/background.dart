
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final String path;
  const Background({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned.fill(child: Stack(
      fit: StackFit.expand,
      children: [

        Image.network(path, fit: BoxFit.cover,),
        Container(color: Colors.black.withOpacity(0.2)),

      ],
    ));
  }

}