
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/providers/scaffold_provider.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../../providers/primary_scroll_provider.dart';
import '../contact_dialog/contact_dialog.dart';

class NavList extends ConsumerWidget{
  const NavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ConstrainedBox(constraints: const BoxConstraints(maxWidth: 200, maxHeight: 75),
          child: SvgPicture.asset("assets/images/rcubed_hrzntl.svg", color: RCubedTheme.primary, fit: BoxFit.fitWidth,)),
          const Divider(thickness: 2,),
          InkWell(
            onTap:(){
              GlobalKey key = ref.watch(homePageProvider);
              ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              if(ref.watch(navBarProvider).currentState!.isEndDrawerOpen) ref.watch(navBarProvider).currentState?.closeEndDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Home", color: RCubedTheme.primary, fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              GlobalKey key = ref.watch(whatWeDoProvider);
              ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              if(ref.watch(navBarProvider).currentState!.isEndDrawerOpen) ref.watch(navBarProvider).currentState?.closeEndDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("What We Do", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              GlobalKey key = ref.watch(whoWeAreProvider);
              ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              if(ref.watch(navBarProvider).currentState!.isEndDrawerOpen) ref.watch(navBarProvider).currentState?.closeEndDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Who We Are", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              GlobalKey key = ref.watch(whyUsProvider);
              ref.watch(scrollController).position.ensureVisible(key.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              if(ref.watch(navBarProvider).currentState!.isEndDrawerOpen) ref.watch(navBarProvider).currentState?.closeEndDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Why Us", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              Navigator.pushNamed(context, '/careers');
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Careers", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              Navigator.pushNamed(context, '/contact');
              // showDialog(
              //     context: context,
              //     builder: (context){
              //       return const ContactForm();
              //     }
              // );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Let's Chat", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

        ],
      ),
    );
  }

}