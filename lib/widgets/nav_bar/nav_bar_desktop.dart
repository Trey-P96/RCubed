import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/contact_dialog/contact_dialog.dart';

import '../../pages/home/home.dart';
import '../../providers/primary_scroll_provider.dart';
import '../../themes/fonts.dart';
import '../logo/logo_simple.dart';

class NavBarDesktop extends ConsumerWidget {
  const NavBarDesktop({Key? key}) : super(key: key);
  final double navBarHeight = 60;
  final double iconSize = 40;
  final double outerPadding = 20;


  @override
  Widget build(BuildContext context, ref) {

    // TODO: implement build
    return Container(
      height: navBarHeight,
      color: RCubedTheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          // ----------------- RCUBED LOGO -----------------
          _NavBarObject(
            child: IconButton(
                padding: EdgeInsets.zero,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Colors.blue,
                onPressed: () {
                  GlobalKey key = ref.watch(homePageProvider);
                  ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                },
                iconSize: iconSize,
                icon: const Logo()),
          ),




          //const Logo(),


          // ----------------- WHAT WE DO -----------------
          _NavBarObject(
            child: AnimatedButton(
              text: 'What We Do',
              textStyle: const TextStyle(color: Colors.white, fontFamily: "MyRoboto", fontSize: 24),
              selectedBackgroundColor: Colors.black,
              selectedTextColor: Colors.white,
              borderColor: Colors.transparent,
              height: 30,
              width: 200,
              borderWidth: 0,
              borderRadius: 50,
              transitionType: TransitionType.LEFT_TOP_ROUNDER,
              animatedOn: AnimatedOn.onHover,
              animationDuration: const Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              onPress: () {
                GlobalKey key = ref.watch(whatWeDoProvider);
                ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              },
            ),
          ),



          // ----------------- WHO WE ARE -----------------
          _NavBarObject(
            child: _NavBarObject(
              child: AnimatedButton(
                text: 'Who We Are',
                textStyle: const TextStyle(color: Colors.white, fontFamily: "MyRoboto", fontSize: 24),
                selectedBackgroundColor: Colors.black,
                selectedTextColor: Colors.white,
                borderColor: Colors.transparent,
                height: 30,
                width: 200,
                borderWidth: 0,
                borderRadius: 50,
                transitionType: TransitionType.LEFT_TOP_ROUNDER,
                animatedOn: AnimatedOn.onHover,
                animationDuration: const Duration(milliseconds: 350),
                backgroundColor: Colors.transparent,
                onPress: () {
                  GlobalKey key = ref.watch(whoWeAreProvider);
                  ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                },
              ),
            ),
          ),



          // ----------------- WHY US -----------------
          _NavBarObject(
            child: AnimatedButton(
              text: 'Why Us',
              textStyle: const TextStyle(color: Colors.white, fontFamily: "MyRoboto", fontSize: 24),
              selectedBackgroundColor: Colors.black,
              selectedTextColor: Colors.white,
              borderColor: Colors.transparent,
              height: 30,
              width: 200,
              borderWidth: 0,
              borderRadius: 50,
              transitionType: TransitionType.LEFT_TOP_ROUNDER,
              animatedOn: AnimatedOn.onHover,
              animationDuration: const Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              onPress: () {
                GlobalKey key = ref.watch(whyUsProvider);
                ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              },
            ),
          ),




          // ----------------- CAREERS -----------------
          _NavBarObject(
            child: AnimatedButton(
              text: 'Careers',
              textStyle: const TextStyle(color: Colors.white, fontFamily: "MyRoboto", fontSize: 24),
              selectedBackgroundColor: Colors.black,
              selectedTextColor: Colors.white,
              borderColor: Colors.transparent,
              height: 30,
              width: 200,
              borderWidth: 0,
              borderRadius: 50,
              transitionType: TransitionType.LEFT_TOP_ROUNDER,
              animatedOn: AnimatedOn.onHover,
              animationDuration: const Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              onPress: () {
                Navigator.pushNamed(context, '/careers');
              },
            ),
          ),


          // ----------------- CONTACT -----------------
          _NavBarObject(
            child: AnimatedButton(
              text: 'Contact',
              textStyle: const TextStyle(color: Colors.white, fontFamily: "MyRoboto", fontSize: 24),
              selectedBackgroundColor: Colors.black,
              selectedTextColor: Colors.white,
              borderColor: Colors.transparent,
              height: 30,
              width: 200,
              borderWidth: 0,
              borderRadius: 50,
              transitionType: TransitionType.LEFT_TOP_ROUNDER,
              animatedOn: AnimatedOn.onHover,
              animationDuration: const Duration(milliseconds: 350),
              backgroundColor: Colors.transparent,
              onPress: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ),


        ],
      ),
    );
  }
}

class _NavBarObject extends StatelessWidget {
  final Widget child;

  const _NavBarObject({required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: child,
    );
  }
}

class _NavBarText extends StatelessWidget{
  final String text;
  const _NavBarText({required this.text, Key? key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text, style: const TextStyle(fontFamily: "MyRoboto", ),);
  }

}
