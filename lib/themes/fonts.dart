import 'package:flutter/material.dart';

class DefaultFonts{
  static const montserrat = "Montserrat";
  static const kumbhsans  = "MyKumbhSans";
}

class RcubedText extends StatelessWidget{

  final String text, fontFamily;
  final Color color;
  final bool isBlockBody;
  final double fontSize, letterSpacing, lineSpacing, wordSpacing;
  const RcubedText(this.text, {this.fontFamily=DefaultFonts.montserrat, this.isBlockBody=false, this.fontSize=20, this.color=Colors.white, this.letterSpacing=1, this.lineSpacing=2, this.wordSpacing=2, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SelectableText(text, style: TextStyle(fontFamily: fontFamily, color: color, fontSize: isBlockBody?18:fontSize, letterSpacing: letterSpacing, height: isBlockBody?1.5:lineSpacing, wordSpacing: isBlockBody?1:wordSpacing),);
  }

}

