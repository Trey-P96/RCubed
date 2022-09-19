
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class SummaryBox extends StatelessWidget{
  final String description;
  const SummaryBox({required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
          child: RcubedText(description,))
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget{
  final String heading, description;
  const DescriptionBox({required this.description, required this.heading, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: RepaintBoundary(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              _Heading(heading: heading,),
              RcubedText(description, isBlockBody: true,),
            ],
          ),
        ),
      ),
    );
  }
}


class _Heading extends StatelessWidget{
  final String heading;
  final Color color, textColor;
  const _Heading({this.color=Colors.white, this.textColor=Colors.black, required this.heading, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(alignment: Alignment.centerLeft, child:
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: FittedBox(child: RcubedText(heading, fontFamily: DefaultFonts.kumbhsans, color: textColor,)),
        ),
      ),
    ));
  }}
