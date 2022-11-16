import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../themes/fonts.dart';
import '../../../../themes/rcubed_theme.dart';

class Footer extends StatelessWidget {
  static String motto = "Our 'WHY' is grounded by our three R's & guides our way of working.";
  static String businessStrtgy = "A business strategy & technology consulting firm.";
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverToBoxAdapter(
      child: ColoredBox(
        color: Shades.swatch6,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Wrap(
            spacing: 60,
            runSpacing: 50,
            alignment: WrapAlignment.spaceAround,
            children: [


              SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 200,
                        height: 50,
                        child: SvgPicture.asset(
                          "assets/images/rcubed_hrzntl.svg",
                          fit: BoxFit.fitHeight,allowDrawingOutsideViewBox: true, alignment: Alignment.topCenter,
                        )),

                    //RichText(text: TextSpan(text: motto, style: const TextStyle(color: Colors.white, fontFamily: DefaultFonts.kumbhsans, fontSize: 18))),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SelectableText.rich(TextSpan(text: businessStrtgy, style: const TextStyle(color: Colors.white, fontFamily: DefaultFonts.kumbhsans, fontSize: 18))),
                    ),
                  ],
                ),
              ),

              Wrap(
                spacing: 60,
                runSpacing: 50,
                alignment: WrapAlignment.spaceEvenly,
                children: const [
                Platforms(),
                WhatWeDoFooter(),
              ],)


            ],
          ),
        ),
      ),
    );
  }
}


class Platforms extends StatelessWidget{
  static double padding=10;
  const Platforms({Key? key}) : super(key: key);
  static List<String> platforms = ["Oracle","NetSuite","Board", "UiPath", "Boomi", "MuleSoft"];
  static List<String> urls = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          Padding(
            padding: EdgeInsets.only(bottom: padding),
            child: const SelectableText("Platforms", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),),
          ),
          Container(height: 1, width:150,color: Colors.white,),
          for(int i=0;i<platforms.length;i++) Padding(
            padding: EdgeInsets.only(top: padding),
            //child: Text(platforms[i], style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),),
            child: SelectableText.rich(
              TextSpan(children: [
                const TextSpan(text: "\u2022 ", style: TextStyle(color: Colors.white)),
                TextSpan(text: platforms[i], style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),)
              ]),
              //textAlign: TextAlign.center,
            ),
          ),


        ],),
    );
  }

}



class WhatWeDoFooter extends StatelessWidget{
  static double padding=10;
  const WhatWeDoFooter({Key? key}) : super(key: key);
  static List<String> whatWeDo = ["Enterprise Applications", "Integration Architecture", "Managed Services", "Co-Sourcing", "Technology Assessment & Selection", "Cloud Application & Integration Roadmaps", "Analytics & Datawarehousing"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          Padding(
            padding: EdgeInsets.only(bottom: padding),
            child: const SelectableText("What We Do", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),),
          ),
          Container(height: 1, width:150,color: Colors.white,),
          for(int i=0;i<whatWeDo.length;i++) Padding(
            padding: EdgeInsets.only(top: padding),
            //child: SizedBox(width: 250, child: Text(platforms[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),)),
            child: SelectableText.rich(
              TextSpan(children: [
              const TextSpan(text: "\u2022 ", style: TextStyle(color: Colors.white)),
              TextSpan(text: whatWeDo[i], style: const TextStyle(fontSize: 18, color: Colors.white, fontFamily: DefaultFonts.kumbhsans),)
            ]),
              //textAlign: TextAlign.center,
            ),
          ),

        ],),
    );
  }

}
