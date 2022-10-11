
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/description_box/description_box.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../network_images/network_images.dart';
import '../../../../themes/fonts.dart';
import '../../../../themes/rcubed_theme.dart';
import '../../../../widgets/cubed_heading/cubed_heading.dart';
import '../../../../widgets/custom_sliver_list/custom_sliver_list.dart';


class CloudCmptExpandingBox extends StatelessWidget{
  final Color color;
  const CloudCmptExpandingBox({Key? key, required this.color}) : super(key: key);

  List<Widget> slivers(){
    return [


      SliverStack(children: [
        SliverPositioned.fill(child: ColoredBox(color: color.withOpacity(0.9),)),
        MultiSliver(children: [
          const SliverToBoxAdapter(
            child: CubedHeading(path: CloudComputing.svgPath,bottomPadding: 20,),),

          CustomSliverBuilder(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(text:CloudComputing.summary,
                      style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: DefaultFonts.kumbhsans, letterSpacing: 3),
                    )),
              )
          ).buildSliver(),



        ]),


      ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverStack(children: [
      SliverPositioned.fill(child: RepaintBoundary(
        child: Material(
          elevation: 10,
          child: Stack(
            children: [
              Positioned.fill(child: CachedNetworkImage(imageUrl: Images.techDesk, fit: BoxFit.cover,),),
              Container(color: color.withOpacity(0.9),)
            ],
          ),
        ),
      )),
      MultiSliver(children: [
        const SliverToBoxAdapter(
          child: CubedHeading(path: CloudComputing.svgPath,bottomPadding: 10, topPadding: 60,),),

        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Align(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(text: CloudComputing.summary,
                        style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: DefaultFonts.kumbhsans, letterSpacing: 2, height: 2),
                      )),
                ),
              ),
            )
        ),



      ]),
    ]);
  }
}






class CloudComputing extends StatelessWidget {
  const CloudComputing({Key? key}) : super(key: key);

  static const svgPath = "assets/images/what_we_do/categories/cloud_computing/cloud_computing.svg";
  static const summary =
      "R-CUBED makes your path to the cloud achievable. Our business focused approach is right sized to your "
      "initiatives.  R-CUBED methods are designed to migrate you to the cloud in a mindful, flexible, and scalable "
      "way - realizing cloud’s benefits today and for the future. Move to the cloud with R-CUBED.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpandingBox(
        svgPath: svgPath,
        summary: summary,
        color: Shades.swatch1,
        buttonColor: Colors.white,
        buttonTextColor: Colors.black,
        expanded: Column(
          children: const [
            _CloudRdyAsmnt(),
            _CloudStrtgyRdMp(),
            _CloudEnblmnt(),
          ],
        )
    );
  }
}

class _CloudRdyAsmnt extends StatelessWidget{
  const _CloudRdyAsmnt({Key? key}) : super(key: key);

  static const heading = "Cloud Readiness Assessment";
  static const description =
      "Let R-CUBED assess and size the value to move to the cloud. Security, unstructured "
      "data, and performance of IT operations are the top drivers to migrate to the cloud. "
      "R-CUBED will baseline your current IT environment and resources. We will build an "
      "insightful value proposition with cloud model considerations (SaaS, PaaS, IaaS, &/or "
      "blended) and decision path options & impacts giving you the confidence to take the "
      "cloud journey.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _CloudStrtgyRdMp extends StatelessWidget{
  const _CloudStrtgyRdMp({Key? key}) : super(key: key);

  static const heading = "Cloud Strategy & Road Map";
  static const description =
      "Let’s shape your cloud value path strategy and ‘must have’ milestones. Are you ready to "
      "move to the cloud and capitalize on reducing technical debt, data modernization, quicker scalability, "
      "greater agility, better use of IT resources, and enhanced data security? R-CUBED will team "
      "with you to build the right cloud migration roadmap and time-phased modernization plan.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _CloudEnblmnt extends StatelessWidget{
  const _CloudEnblmnt({Key? key}) : super(key: key);

  static const heading = "Cloud Enablement";
  static const description =
      "Team with R-CUBED to move to the cloud.  Our agile, value-focused method helps you move to a cloud solution – "
      "whether that be from your on-premise environment to the cloud or a net new cloud platform. Let’s help you execute "
      "a smooth migration to the cloud with timely stage gates to manage progress, mitigate risk, and modernize your way "
      "of working.  We know how to enable cloud success.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}
