

import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/custom_painter/custom_painter.dart';

import '../../themes/fonts.dart';
import '../column_builder/column_builder.dart';

final List<InlineSpan> list = [
  for(int i=0;i<100;i++)const TextSpan(text: "THIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXTTHIS IS TEXT",style: TextStyle(fontSize: 12))
];

class Testing extends StatelessWidget{
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

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




        _TextBuilder(style: const TextStyle(fontSize: 25,),text: "What do we know. What do we know. What do we know. "*100, textAlign: TextAlign.center, leadingChar: 35, lineSpacing: 20,),
        // Visibility( maintainAnimation: true, visible:false, maintainState:true, maintainSize:true, child: RichText(text: const TextSpan(text: "What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. What do we know. ", style: TextStyle(fontSize: 40)),))

      ],
    );
  }

}



class _TextBuilder extends StatelessWidget{
  final String text;
  final TextStyle style;
  final double leadingChar, lineSpacing;
  final TextAlign textAlign;
  const _TextBuilder({required this.text, required this.style, this.leadingChar=0, this.lineSpacing=0, this.textAlign=TextAlign.start, Key? key}) : super(key: key);


  // List<Widget> textBuilder(BuildContext context){
  //   List<String> words = text.split(" ");
  //   List<Widget> builtLines = [];
  //   List<TextSpan> currentLine = [];
  //
  //
  //   TextPainter textPainter = TextPainter(
  //       text: TextSpan(
  //           text: "XXX", style: style
  //       ),
  //       textAlign: textAlign,
  //       textDirection: TextDirection.ltr
  //   );
  //
  //   textPainter.layout();
  //   double width = min(MediaQuery.of(context).size.width, 1200);
  //   double w = width/(textPainter.width/30);
  //   double accumulator=0;
  //
  //
  //   for(int i=0;i<words.length;i++){
  //     // print(w);
  //     // print(textPainter.width);
  //     // print(width);
  //
  //     String word = i==words.length-1?words[i]:" ${words[i]} ";
  //     accumulator+=word.length;
  //     if(accumulator < w){
  //       currentLine.add(TextSpan(text: word, style: style));
  //     }
  //     else{
  //       builtLines.add(TestText(span: TextSpan(children: currentLine.toList(), style: style)));
  //       currentLine.clear();
  //       currentLine.add(TextSpan(text: word, style: style));
  //       accumulator=word.length.toDouble();
  //     }
  //
  //     if(i==words.length-1){
  //       builtLines.add(TestText(span:TextSpan(
  //         children: currentLine.toList(),
  //       )));
  //     }
  //
  //
  //   } // END OF LOOP LOGIC
  //
  //   return builtLines;
  // }



  Future<List<TextSpan>> builder(BoxConstraints size) async{
    List<String> words = text.split(" ");
    List<TextSpan> builtLines = [], currentLine = [];
    bool didExceedMaxLines = false;



    for(int i=0;i<words.length;i++){

      // --------------------------------------------- STYLE WORD TO TEXTSPAN
      TextSpan textSpan = (i==0)&&leadingChar!=0? // IF FIRST CHARACTER OF FIRST WORD SHOULD BE BIGGER THAN REST OF TEXT
      TextSpan(
        children: [
          TextSpan(text: words[0][0], style: style.copyWith(fontSize: leadingChar)), //first letter of first word
          TextSpan(text: words[0].substring(1), style: style), // first word excluding first character
        ]
      )
      :
      i==0?
      TextSpan(           // ELSE IF IS FIRST WORD AND LEADING IS NOT SPECIFIED
          text: words[i],
          style: style,
      )
      :
      TextSpan(           // IS NOT FIRST WORD, ADD A WHITESPACE CHARACTER IN FRONT OF WORD
        text: " ${words[i]}",
        style: style,
      );


      // ---------------------------------------------- PAINT LINE AND CHECK IF OVERFLOW
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          children: currentLine + [textSpan]
        ),
        textAlign: textAlign,
        textDirection: TextDirection.ltr
      );

      textPainter.layout();
      didExceedMaxLines = textPainter.width > size.maxWidth;



      // ---------------------------------------------- ADD TO CURRENT LINE IF NO OVERFLOW,
      // ---------------------------------------------- ELSE IF OVERFLOW ADD TO BUILT LINE
      // ---------------------------------------------- AND ADD OVERFLOW WORD TO NEW LINE
      if(didExceedMaxLines){
        builtLines.add(TextSpan(
          children: currentLine.toList(),
        ));
        currentLine.clear();
        currentLine.add(textSpan);

      }
      else {currentLine.add(textSpan);}


      // ---------------------------------------------- IF AT END OF LOOP, ADD REMAINING TEXT THAT DID NOT OVERFLOW
      if(i==words.length-1){
        builtLines.add(TextSpan(
          children: currentLine.toList(),
        ));
      }

    } // END OF LOOP LOGIC


    return builtLines;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (context, size){
      return FutureBuilder(
          future: builder(size),
          initialData: const <TextSpan>[],
          builder: (context, snapshot){

            if(snapshot.hasData){
              final lines = snapshot.data as List<TextSpan>;

              return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  itemCount: lines.length,
                  itemBuilder: (context, index){
                return RichText(text: lines[index], textAlign: textAlign,);
              });
            }
            return RichText(text: TextSpan(text: text, style: style), textAlign: textAlign,);
      });
    });
  }
}
