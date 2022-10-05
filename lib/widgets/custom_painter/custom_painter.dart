

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../themes/fonts.dart';


final painterHeight = StateProvider<double>((ref) => 0);
final screenWidth = StateProvider<double>((ref) => 0);



class MyRcubedText extends StatelessWidget{
  final String text;
  final double fontSize;
  const MyRcubedText({required this.text, this.fontSize=20, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SizedBox(
          height: 300,
          child: CustomPaint(
            painter: RcubedTextPainter(text: text, fontSize: fontSize),
          ),
        );
      ;
  }

}








class RcubedTextPainter extends CustomPainter{
  final String text;
  final Color color;
  final double fontSize;

  RcubedTextPainter({
    required this.text,
    this.color=Colors.black,
    required this.fontSize,
  });


  @override
  void paint(Canvas canvas, Size size) {

    // TODO: implement paint

    TextStyle textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
    );


    TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
      ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center
    );

    textPainter.layout(maxWidth: size.width);

    double xCenter = (size.width - textPainter.width) / 2;
    double yCenter = (size.height - textPainter.height) / 2;
    Offset offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}