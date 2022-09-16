
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';

class NestedNavBar extends StatelessWidget{
  final String title;
  final List<Widget> menuButtons;
  const NestedNavBar({required this.title, this.menuButtons=const[], Key? key}) : super(key: key);


  void scrollToIndex(GlobalKey key){}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          //boxShadow: [BoxShadow(color: Colors.black, offset: Offset(0,0),spreadRadius: 0, blurRadius: 5)]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: RcubedText(title, color: Colors.black, fontSize: 30, fontFamily: DefaultFonts.kumbhsans,)),
            menuButtons.isNotEmpty?Container(color: Colors.black, height: 1,):const SizedBox(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: menuButtons,
              ),
            ),
          ],
        ),
      ),
    );
  }

}