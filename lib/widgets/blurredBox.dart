
import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBox extends StatelessWidget{
  final Widget child;
  final double width, height, radius, blurX, blurY, opacity;
  final EdgeInsets padding;
  final Color color;

  const BlurredBox({
    required this.child,
    this.width=600,
    this.height=80,
    this.radius=0,
    this.color=Colors.black,
    this.opacity=0.35,
    this.padding=EdgeInsets.zero,
    this.blurX=5,
    this.blurY=5,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
          child: FittedBox(
            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              color: color.withOpacity(opacity),
              child: Align(
                alignment: Alignment.center,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }

}