
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rcubed/themes/fonts.dart';

class CaseStudyOne extends StatelessWidget{
  const CaseStudyOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Heading(),
                _Challenge(),
                _Solution(),
                _Outcome(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class _Heading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SvgPicture.asset("assets/images/why_us/case_studies/case_study_c.svg", width: 400,),
              Image.asset("assets/images/why_us/case_studies/sincro.png", width: 400,)
            ],
          ),
        ));
  }

}



class _Challenge extends StatelessWidget{
  final String description = "Aggressive timeline for acquisition integration. Sincro Digital's information technology infrastructure had to be fully migrated within nine months from the acquisition close date. The clock was ticking and a lot of work had to be done to avoid business disruption.";
  final TextStyle style = const TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black.withOpacity(0.8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: SelectableText("The Challenge:", style: style.copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SelectableText(description, style: style.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Solution extends StatelessWidget{
  final String description = "Engage R-CUBED to drive integration architecture, migration, and database move. R-CUBED's forward thinking leadership & execution enabled an on-time, on-budget delivery of Sincro Digital's enterprise integration migration.";
  final TextStyle style = const TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black.withOpacity(0.8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: SelectableText("The Solution:", style: style.copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SelectableText(description, style: style.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Outcome extends StatelessWidget{
  final String description = "Modernized integration architecture and more efficient enterprise application integration. Sincro Digital is fully assimilated into their parent's I.T. infrastructure. With R-CUBED's leadership and support, Sincro Digital realized simplicity and efficiency in daily operations, reduced manual touch points & work arounds, and a more efficient enterprise application integration.";
  final TextStyle style = const TextStyle(fontFamily: DefaultFonts.kumbhsans, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black.withOpacity(0.8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: SelectableText("The Outcome:", style: style.copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SelectableText(description, style: style.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}