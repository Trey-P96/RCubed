

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/custom_painter/custom_painter.dart';

import '../../themes/fonts.dart';

final List<InlineSpan> list = [
  for(int i=0;i<100;i++)const TextSpan(text: "THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT",style: TextStyle(fontSize: 12))
];

class TextBuilder extends StatelessWidget{
  const TextBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [

        // CustomScrollView(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   slivers: [
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate((context,index){return RichText(softWrap: false, overflow: TextOverflow.ellipsis, text: list[index]);} ,
        //           // addAutomaticKeepAlives: false,
        //           // addRepaintBoundaries: false,
        //           childCount: list.length),
        //     )
        //   ],
        // ),



        //_BuildLine(text: "${(MediaQuery.of(context).size.shortestSide).toString()} xCOME ON This is a text that i want to overflow. Hurry up and overflow.",),
        _BuildLine(text: "kCOME ON This is a text that i want to overflow. Hurry up and overflow.",),

      ],
    );
  }

}



class _BuildLine extends StatelessWidget{
  final String text;
  const _BuildLine({required this.text, Key? key}) : super(key: key);

  Future<List<String>> builder(BoxConstraints size) async{

    List<String> words = text.split(" ");
    List<String> lines = [];
    bool didExceedMaxLines = false;
    String line = "";
    for(String word in words) {
      String tmp = line;
      if(line=="") {tmp += word;}
      else{tmp += " $word";}
      TextPainter textPainter = TextPainter(
          text: TextSpan(text: tmp,
              style: const TextStyle(fontSize: 50)),
          maxLines: 1,
          textDirection: TextDirection.ltr
      );
      textPainter.layout();
      didExceedMaxLines = textPainter.width > size.maxWidth;

      if(didExceedMaxLines){
        lines.add(line);
        line = word;
      }
      else{line = tmp;}
    }
    lines.add(line);

    return lines;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (context, size){
      return FutureBuilder(
          future: builder(size),
          initialData: const <String>[],
          builder: (context, snapshot){

            if(snapshot.connectionState == ConnectionState.done){

              final lines = snapshot.data as List<String>;
              return Column(
                children: [
                  for(String line in lines) RichText(text: TextSpan(text: line, style: const TextStyle(fontSize: 50)))
                ],
              );


              // return CustomScrollView(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   slivers: [
              //     SliverList(
              //       delegate: SliverChildBuilderDelegate((context,index){return RichText(text: TextSpan(text: lines[index], style: const TextStyle(fontSize: 50)));} ,
              //           childCount: lines.length),
              //     )
              //   ],
              // );
            }

            return RichText(text: TextSpan(text: text, style: const TextStyle(fontSize: 50)));
      });
      // return RichText(text: TextSpan(text: text, style: const TextStyle(fontSize: 50)));
    });
  }
}

class _Word extends StatelessWidget{
  final String text;
  const _Word({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(text: const TextSpan(
      children: [
        WidgetSpan(child: Visibility(visible: false, child: Text("THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT"),)),
        WidgetSpan(child: Visibility(visible: false, child: Text("THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT"),)),
        WidgetSpan(child: Visibility(visible: false, child: Text("THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT"),)),
        WidgetSpan(child: Visibility(visible: false, child: Text("THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT"),)),
        WidgetSpan(child: Visibility(visible: false, child: Text("THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT"),)),
      ]
    ));
  }

}