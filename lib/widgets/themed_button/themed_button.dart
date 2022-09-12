
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';


import '../../themes/fonts.dart';

class ThemedButton extends StatelessWidget{
  final String label;
  final VoidCallback? onPressed;
  const ThemedButton({required this.label, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 40, top: 20, bottom: 20),
      child: Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(onPressed: onPressed,
            child: RcubedText(label,),
            style: ElevatedButton.styleFrom(primary: RCubedTheme.primary, shape: const StadiumBorder()),)),
    );
  }

}