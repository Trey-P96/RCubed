import 'package:flutter/material.dart';

class RcubedText extends StatelessWidget{
  final String text;
  final Color color;
  final double fontSize;
  const RcubedText(this.text, {this.fontSize=20, this.color=Colors.white, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text, style: TextStyle(fontFamily: "MyKumbhSans", color: color, fontSize: fontSize, letterSpacing: 1, height: 2, wordSpacing: 2),);
  }

}