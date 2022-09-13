
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';


import '../../themes/fonts.dart';

class ThemedButton extends StatelessWidget{
  final String label;
  final VoidCallback? onPressed;
  final Alignment alignment;
  final Color color, textColor;
  const ThemedButton({this.alignment=Alignment.center, this.textColor=Colors.white, required this.label, required this.onPressed, this.color=RCubedTheme.primary, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 40, top: 20, bottom: 20),
      child: Align(
          alignment: alignment,
          child: ElevatedButton(onPressed: onPressed,
            child: RcubedText(label, color: textColor, fontFamily: DefaultFonts.kumbhsans,),
            style: ElevatedButton.styleFrom(primary: color, shape: const StadiumBorder()),)),
    );
  }

}