
import 'dart:math';
import 'dart:ui';

import 'package:asset_cache/asset_cache.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/widgets/text_builder/text_builder.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';
import '../custom_painter/custom_painter.dart';


class NestedNavBar extends StatelessWidget{
  final String headerSvgPath, summary;
  final List<Widget> menuButtons;
  const NestedNavBar({required this.headerSvgPath, required this.summary, this.menuButtons=const[], Key? key}) : super(key: key);


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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Title(),

          //MyRcubedText(text: summary, fontSize: 30,),
          //for(int i=0;i<100;i++) const TextTest(),
          TextBuilder()
          // Flexible(
          //   child: RepaintBoundary(
          //     child: RichText(
          //         maxLines: 20,
          //         overflow: TextOverflow.ellipsis,
          //         text: TextSpan(
          //             style: const TextStyle(fontSize: 20, color: Colors.black),
          //             text: summary
          //         )),
          //   ),
          // ),

          

          //Container(color: Colors.black, height: 1,),
          //Center(child: _Summary(text: summary, fontSize: 18)),
          //menuButtons.isNotEmpty?Container(color: Colors.black, height: 1,):const SizedBox(),
          //_MenuButtons(menuButtons: menuButtons),
        ],
      ),
    );
  }
}




class _Title extends StatelessWidget{
  const _Title({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
          child: Center(
            // child: SimpleShadow(child: SvgPicture.asset(svg, fit: BoxFit.fitWidth,), offset: const Offset(0,3),sigma: 4, opacity: 0.3,),
            child: SizedBox(width: 450, height: 80, child: CachedNetworkImage(imageUrl: "https://i.imgur.com/3O55w0C.png",))
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



class TextTest extends StatelessWidget {
  const TextTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text("This is a line of text, I need to fill this line with text.", style: TextStyle(fontSize: 30),);
  }
}