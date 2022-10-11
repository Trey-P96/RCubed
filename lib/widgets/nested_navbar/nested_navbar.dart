
import 'dart:math';
import 'dart:ui';

import 'package:asset_cache/asset_cache.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/pages/home/what_we_do/what_we_do.dart';
import 'package:rcubed/widgets/custom_sliver_list/custom_sliver_list.dart';
import 'package:rcubed/widgets/text_builder/text_builder.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';
import '../column_builder/column_builder.dart';
import '../custom_painter/custom_painter.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../device_listener/device_listener.dart';





class Header extends StatelessWidget{
  final String summary, headingUrl;
  final List<NavButton> navButtons;
  //static String summary = '''We transform the way people work by putting clients at the center of business solutions. Our disruptive model converts possibilities into real business value. Let’s build a better tomorrow.''';
  const Header({Key? key, required this.navButtons, required this.headingUrl, required this.summary}) : super(key: key);

  List<Widget> buildSlivers(){
    List<Widget> slivers = [



    ];

    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverStack(children: [
      SliverPositioned.fill(child: RepaintBoundary(
        child: Material(
          elevation: 10,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Palette.offWhite],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
      )),


      MultiSliver(children: [
        SliverToBoxAdapter(child: Heading(url: headingUrl,)),

        SliverToBoxAdapter(child: Container(height: 1, color: Colors.black,)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: summary[0], style: const TextStyle(fontSize: 32, color: Colors.black, fontFamily: DefaultFonts.kumbhsans)),
                        TextSpan(text: summary.substring(1), style: const TextStyle(fontSize: 26, color: Colors.black,height: 2, letterSpacing: 2, fontFamily: DefaultFonts.kumbhsans))
                      ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(height: 1, color:Colors.black,),
        ),


        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Align(
            child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1050),
                child: Wrap( alignment: WrapAlignment.spaceEvenly, spacing:60, runSpacing: 10, children: navButtons)),
          ),
        ),),










      ]),
    ]);
  }

}




class NavButton extends ConsumerWidget{
  final String text;
  final GlobalKey? indexKey;
  final double width, borderWidth, selectedBgOpacity, fontSize;
  final Color textColor, selectedBackgroundColor, selectedTextColor, backgroundColor, borderColor;
  const NavButton({
    required this.text,
    this.indexKey,
    this.width=300,
    this.fontSize=22,
    this.textColor=Colors.black,
    this.selectedBackgroundColor=Colors.black,
    this.backgroundColor=Colors.transparent,
    this.selectedTextColor=Colors.white,
    this.selectedBgOpacity=0.7,
    this.borderWidth=2,
    this.borderColor=Colors.black,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RepaintBoundary(
        child: AnimatedButton(
            text: text,
            textStyle: TextStyle(color: textColor, fontFamily: DefaultFonts.kumbhsans, fontSize: fontSize),
            backgroundColor: backgroundColor,
            selectedTextColor: selectedTextColor,
            borderColor: borderColor.withOpacity(0.2),
            selectedBackgroundColor: selectedBackgroundColor.withOpacity(selectedBgOpacity),
            transitionType: TransitionType.LEFT_TOP_ROUNDER,
            width: width,
            height: 30,
            borderRadius: 50,
            borderWidth: borderWidth,
            animatedOn: AnimatedOn.onHover,
            animationDuration: const Duration(milliseconds: 350),
            onPress: (){
              if(indexKey != null){
                ref.watch(scrollController).position.ensureVisible(indexKey!.currentContext!.findRenderObject()!, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              }

            }
        ),
      ),
    );
  }

}







class NestedNavBar extends StatelessWidget{
  final String headerSvgPath, summary;
  final List<Widget> menuButtons;


  const NestedNavBar({required this.headerSvgPath, required this.summary, this.menuButtons=const[], Key? key}) : super(key: key);

  List<Widget> buildList(){
    final List<Widget> list = [
      //const Heading(),
      //
      // Container(height: 1, color: Colors.black,),
      //
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      //   child: TextBuilder(text: summary, style: const TextStyle(fontSize: 25, fontFamily: DefaultFonts.kumbhsans, letterSpacing: 3), leadingChar: 35, textAlign: TextAlign.center, lineSpacing: 5,),
      //   //child: RichText(text: TextSpan(text: summary, style: const TextStyle(fontSize: 25, fontFamily: DefaultFonts.kumbhsans, letterSpacing: 3)),),
      // ),
      //
      // Container(height: 1, color: Colors.black,),
      //
      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 40),
      //   child: Wrap(
      //     crossAxisAlignment: WrapCrossAlignment.center,
      //     alignment: WrapAlignment.center,
      //     spacing: 50,
      //     runSpacing: 25,
      //     children: const [
      //       MenuButton(label: "Enterprise Applications"),
      //       MenuButton(label: "Integration Architecture"),
      //       MenuButton(label: "Cloud Computing"),
      //       MenuButton(label: "Managed Services"),
      //       MenuButton(label: "Co Sourcing"),
      //       MenuButton(label: "Technologies"),
      //     ],
      //   ),
      // )
    ];
    return list;
  }

  void scrollToIndex(GlobalKey key){}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Text(summary+summary);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [Colors.white, Palette.offWhite])),

      // child: ColumnBuilder(itemBuilder: (BuildContext context, int index) {
      //   return buildList()[index];
      // }, itemCount: buildList().length,),

      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        addRepaintBoundaries: false,
        addAutomaticKeepAlives: false,
        itemCount: buildList().length,
        itemBuilder: (BuildContext context, int index) {
          return buildList()[index];
        }),



      // child: SingleChildScrollView(
      //   child: Column(
      //     children: buildList(),
      //   ),
      // ),

      );
  }
}




class Heading extends StatelessWidget{
  final String url;
  const Heading({required this.url, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
          child: Center(
            // child: SimpleShadow(child: SvgPicture.asset(svg, fit: BoxFit.fitWidth,), offset: const Offset(0,3),sigma: 4, opacity: 0.3,),
            child: SizedBox(width: 450, height: 80, child: CachedNetworkImage(imageUrl: url,))
          ),
        ),
        const _AlignCorners(),


        //Container(alignment: Alignment.topLeft, padding: const EdgeInsets.all(10), child: SvgPicture.asset("assets/images/cubed_left_corner.svg", fit: BoxFit.fitWidth,)),
        //Container(alignment: Alignment.topRight, padding: const EdgeInsets.all(10), child: SvgPicture.asset("assets/images/cubed_right_corner.svg", fit: BoxFit.fitWidth,)),
      ],
    );
  }
}







class _AlignCorners extends StatelessWidget{
  const _AlignCorners({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(alignment: Alignment.topCenter, padding: const EdgeInsets.all(10),
            child: MediaQuery.of(context).size.width>600?CachedNetworkImage(imageUrl: "https://i.imgur.com/ugPSJSB.png",):null),
        Container(alignment: Alignment.topCenter, padding: const EdgeInsets.all(10),
            child: MediaQuery.of(context).size.width>600?CachedNetworkImage(imageUrl: "https://i.imgur.com/e31zf1A.png",):null),
      ],
    );
  }

}

class _Summary extends StatelessWidget{
  final String text;
  final double fontSize;
  const _Summary({required this.text, required this.fontSize, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: SizedBox(
        width: 700,
        
        // child:RichText(
        //   textAlign: TextAlign.center,
        //   text: TextSpan(
        //   children: [
        //     TextSpan(text: text[0], style: TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 18, color: Colors.black.withOpacity(0.8))),
        //     TextSpan(text: text.substring(1), style: TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 18, color: Colors.black.withOpacity(0.8), letterSpacing: 1.5, wordSpacing: 2, height: 2))
        //   ]
        // ),),
      ),
    );
  }
  
}



class MenuButton extends StatelessWidget{
  final String label;
  const MenuButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return InkWell(
    //   onTap: (){},
    //   child: Text(label, style:  const TextStyle(color: Colors.black, fontFamily: DefaultFonts.kumbhsans, fontSize: 20),),
    // );

    return AnimatedButton(
        text: label,
        textStyle: const TextStyle(color: Colors.black, fontFamily: DefaultFonts.kumbhsans, fontSize: 20),
        backgroundColor: Colors.transparent,
        selectedTextColor: Colors.white,
        //borderColor: Colors.black.withOpacity(0.2),
        selectedBackgroundColor: Colors.black.withOpacity(0.7),
        transitionType: TransitionType.LEFT_TOP_ROUNDER,
        width: 250,
        height: 30,
        borderRadius: 50,
        borderWidth: 1,
        animatedOn: AnimatedOn.onHover,
        animationDuration: const Duration(milliseconds: 350),
        onPress: (){}
    );
  }

}