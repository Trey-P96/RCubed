
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../themes/fonts.dart';
import '../../../../widgets/nested_navbar/nested_navbar.dart';

StateProvider<GlobalKey> industriesKey = StateProvider((ref) => GlobalKey());
StateProvider<GlobalKey> storiesKey = StateProvider((ref) => GlobalKey());

class WhyUs extends ConsumerWidget{
  static String summary = "At R-CUBED we walk our talk. Employees & clients are at the heart of our operating model. We are committed to building a better tomorrow together.";
  static String headingSVG = "https://i.imgur.com/HfcLCeF.png";

  const WhyUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return MultiSliver(children: [
      Header( headingUrl: headingSVG, summary: summary,
        navButtons: const [
          // NavButton(text: "Industries", indexKey: ref.watch(industriesKey),),
          // NavButton(text: "Stories", indexKey: ref.watch(storiesKey),),
      ],),


      SliverStack(children: [
        SliverPositioned.fill(child: ColoredBox(color: Colors.black.withOpacity(0.9),)),

        MultiSliver(children: [
          //Industries(key: ref.watch(industriesKey),),
          Stories(key: ref.watch(storiesKey),),
        ]),

      ]),


    ]);
  }
}


class Stories extends StatelessWidget{
  static String svgHeading = "assets/images/why_us/whyUs.svg";
  static String stories = '''100% reference-able & out of the park Client Advocacy is the R-CUBED Way. We are committed to engaging & delivering real business outcome and making sure you have a first-in-class client experience ... One Idea, One Solution, One Think Ahead.''';
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiSliver(children: [
      SliverToBoxAdapter(child: CubedHeading(path: svgHeading, bottomPadding: 0, topPadding: 90,),),
      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Align(
          child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 800),
          child: RichText(textAlign:TextAlign.center, text: TextSpan(text: stories, style: const TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 2, height: 2, fontFamily: DefaultFonts.kumbhsans)),)),
        ),
      ),),

      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 60),
        child: Center(child: AnimatedButton(
          text: 'Acquisition Integration',
          textStyle: const TextStyle(color: Colors.black, fontFamily: DefaultFonts.kumbhsans, fontSize: 22),
          selectedBackgroundColor: RCubedTheme.primary,
          selectedTextColor: Colors.white,
          borderColor: Colors.transparent,
          height: 30,
          width: 300,
          borderWidth: 0,
          borderRadius: 50,
          transitionType: TransitionType.LEFT_TOP_ROUNDER,
          animatedOn: AnimatedOn.onHover,
          animationDuration: const Duration(milliseconds: 350),
          backgroundColor: Colors.white,
          onPress: () {
            Navigator.pushNamed(context, '/stories');
          },
        )),
      ),)


    ]);
  }

}


class Industries extends StatelessWidget{
  static String industriesSvg = "assets/images/why_us/industries.svg";
  static String summary = '''We focus on solving for challenges, complexities & intricacies within specific industry domains. We have industry specific points of view & working solutions helping our clients navigate their industry needs & accelerate speed to value.''';
  const Industries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiSliver(children: [
      SliverToBoxAdapter(child: CubedHeading(path: industriesSvg, bottomPadding: 0, topPadding: 90,),),

      SliverToBoxAdapter(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Align(
          child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 800),
              child: RichText(textAlign:TextAlign.center, text: TextSpan(text: summary, style: const TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 2, height: 2, fontFamily: DefaultFonts.kumbhsans)),)),
        ),
      ),),
    ]);
  }

}