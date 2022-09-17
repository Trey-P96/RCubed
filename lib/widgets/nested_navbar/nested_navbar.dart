
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';

class NestedNavBar extends StatelessWidget{
  final String headerSvgPath, summary;
  final List<Widget> menuButtons;
  const NestedNavBar({required this.headerSvgPath, required this.summary, this.menuButtons=const[], Key? key}) : super(key: key);


  void scrollToIndex(GlobalKey key){}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                    child: SimpleShadow(child: SvgPicture.asset(headerSvgPath, fit: BoxFit.fitWidth,), offset: const Offset(0,3),sigma: 4, opacity: 0.3,),
                  ),
                ),
                Container(alignment: Alignment.topLeft, padding: const EdgeInsets.all(10), child: SimpleShadow(child: SvgPicture.asset("assets/images/cubed_left_corner.svg", fit: BoxFit.fitWidth,), offset: const Offset(0,3),sigma: 4, opacity: 0.3,)),
                Container(alignment: Alignment.topRight, padding: const EdgeInsets.all(10), child: SimpleShadow(child: SvgPicture.asset("assets/images/cubed_right_corner.svg", fit: BoxFit.fitWidth,), offset: const Offset(0,3),sigma: 4, opacity: 0.3,)),
              ],
            ),

            //Center(child: RcubedText(title, color: Colors.black, fontSize: 30, fontFamily: DefaultFonts.kumbhsans,)),
            menuButtons.isNotEmpty?Container(color: Colors.black, height: 1,):const SizedBox(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: menuButtons,
              ),
            ),
            Container(color: Colors.black, height: 1,),
            Center(child: _Summary(text: summary)),
          ],
        ),
      ),
    );
  }

}

class _Summary extends StatelessWidget{
  final String text;
  const _Summary({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: SizedBox(
        width: 700,
        child:RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
          children: [
            TextSpan(text: text[0], style: TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 40, color: Colors.black.withOpacity(0.8))),
            TextSpan(text: text.substring(1), style: TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 24, color: Colors.black.withOpacity(0.8), letterSpacing: 1.5, wordSpacing: 2, height: 2))
          ]
        ),),
      ),
    );
  }
  
}