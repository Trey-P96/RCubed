
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../custom_scroll_physics/custom_scroll_physics.dart';
import '../../network_images/network_images.dart';
import '../../themes/fonts.dart';
import '../../themes/rcubed_theme.dart';
import '../../widgets/background/background.dart';
import 'case_study1/case_study1.dart';

class AcquisitionIntegration extends StatelessWidget{
  const AcquisitionIntegration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.5,
            child: Image.network(Images.storiesBG, fit: BoxFit.cover,),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: RCubedTheme.primary,
            centerTitle: true,
            elevation: 5,
            title: SvgPicture.asset("assets/images/why_us/stories.svg"),
          ),
          body: SingleChildScrollView(
            physics: const CustomScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CaseStudyOne(),


                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 50),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Return", style: TextStyle(color: Colors.white, fontFamily: DefaultFonts.kumbhsans),),
                    ),),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
