
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/scaffold_provider.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../../providers/primary_scroll_provider.dart';
import '../contact_dialog/contact_dialog.dart';

class NavList extends StatelessWidget{
  const NavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          InkWell(
            onTap:(){
              // Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState!.animateTo(0);
              if(Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.isEndDrawerOpen){
                Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.closeEndDrawer();
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Home", color: RCubedTheme.primary, fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              // Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState!.animateTo(1);
              if(Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.isEndDrawerOpen){
                Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.closeEndDrawer();
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("What We Do", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              // Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState!.animateTo(2);
              if(Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.isEndDrawerOpen){
                Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.closeEndDrawer();
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Who We Are", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              // Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState!.animateTo(3);
              if(Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.isEndDrawerOpen){
                Provider.of<ScaffoldProvider>(context, listen: false).getKey().currentState!.closeEndDrawer();
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Why Us", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){

            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: RcubedText("Careers", color: RCubedTheme.primary,fontFamily: DefaultFonts.kumbhsans, isBlockBody: true,),
            ),
          ),
          const Divider(),

          InkWell(
            onTap:(){
              showDialog(
                  context: context,
                  builder: (context){
                    return const ContactForm();
                  }
              );
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