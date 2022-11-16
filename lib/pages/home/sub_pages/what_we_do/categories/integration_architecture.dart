
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/widgets/description_box/description_box.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../../network_images/network_images.dart';
import '../../../../../themes/rcubed_theme.dart';
import '../../../../../widgets/cubed_heading/cubed_heading.dart';
import '../../../../../widgets/custom_sliver_list/custom_sliver_list.dart';





class IntArchExpandingBox extends StatelessWidget{
  final Color color;
  const IntArchExpandingBox({Key? key, required this.color}) : super(key: key);

  List<Widget> slivers(){
    return [


      SliverStack(children: [
        SliverPositioned.fill(child: RepaintBoundary(
          child: Material(
            elevation: 10,
            child: Stack(
              children: [
                Positioned.fill(child: CachedNetworkImage(imageUrl: Images.infinityPool, fit: BoxFit.cover,),),
                Container(color: color.withOpacity(0.9),)
              ],
            ),
          ),
        )),
        MultiSliver(children: [
          const SliverToBoxAdapter(
            child: CubedHeading(path: IntegrationArchitecture.integrationArchSVG,bottomPadding: 20,),),

          CustomSliverBuilder(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(text: IntegrationArchitecture.description,
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
              Positioned.fill(child: CachedNetworkImage(imageUrl: Images.infinityPool, fit: BoxFit.cover,),),
              Container(color: color.withOpacity(0.9),)
            ],
          ),
        ),
      )),
      MultiSliver(children: [
        const SliverToBoxAdapter(
          child: CubedHeading(path: IntegrationArchitecture.integrationArchSVG,bottomPadding: 10, topPadding: 60,),),

        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Align(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: const SelectableText.rich(
                    TextSpan(text: IntegrationArchitecture.description,
                      style: TextStyle(fontSize: 22, color: Colors.white, fontFamily: DefaultFonts.kumbhsans, letterSpacing: 2, height: 2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ),



      ]),
    ]);
  }
}





class IntegrationArchitecture extends StatelessWidget {
  const IntegrationArchitecture({Key? key}) : super(key: key);

  static const String integrationArchSVG = "assets/images/what_we_do/categories/integration_architecture/integration_architecture.svg";
  static const String description =
      "R-CUBED’s vision & know how designing and implementing enterprise integrations solutions provides a flexible foundation to optimize "
      "business performance.We boost your ability to adapt to change and enhance decision making with richer insight through an integrated business.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpandingBox(
        svgPath: integrationArchSVG,
        summary: description,
        color: Palette.darkBlueShade,
        buttonColor: Colors.white,
        buttonTextColor: Colors.black,
        expanded: Column(
          children: const [
            _DiagAsmnt(),
            _StrtgyRoadMp(),
            _ResArch(),
            _DevImplmnt(),
            _SuppMngmt(),
            _DataAnalytics(),
          ],
        ),
    );
  }
}

class _DiagAsmnt extends StatelessWidget{
  const _DiagAsmnt({Key? key}) : super(key: key);

  static const heading = "Diagnostic & Assessment";
  static const description =
      "R-CUBED will work with you to build a value proposition for ‘first-in-class’ integration frameworks, platforms, "
      "and processes that ignite digital transformation today & flex for the future. We will baseline your current integration "
      "landscape and position options for modernization that are fit for purpose with your strategy and business initiatives.";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _StrtgyRoadMp extends StatelessWidget{
  const _StrtgyRoadMp({Key? key}) : super(key: key);

  static const heading = "Strategy & Road-Map";
  static const description =
      "R-CUBED helps organizations develop an integration strategy that drives business transformation "
      "with organizational flexibility to quickly respond to evolving market demands.An integration strategy "
      "is a ‘must have’ in today’s continuous disruption and pace of change.R-CUBED will team with you to create "
      "a time-phased integration roadmap to fuel your digital transformation journey.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _ResArch extends StatelessWidget{
  const _ResArch({Key? key}) : super(key: key);

  static const heading = "Resilient Architecture";
  static const description =
      "We understand that agility, performance, and data quality are critical to business success and "
      "sustainability.R-CUBED’s integration design methodology constructs a foundation that is scalable, "
      "supportable, and reusable. Let’s work together to realize these benefits today & be ready for tomorrow’s demands.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _DevImplmnt extends StatelessWidget{
  const _DevImplmnt({Key? key}) : super(key: key);

  static const heading = "Development & Implementation";
  static const description =
      "R-CUBED unleashes business performance by building and implementing integration solutions that lay "
      "the foundation for business services. Our proprietary and agile methods deliver digital enablement "
      "that is core in achieving quality, completeness, and responsiveness to business needs.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _SuppMngmt extends StatelessWidget{
  const _SuppMngmt({Key? key}) : super(key: key);
  
  static const heading = "Support & Change Management";
  static const description =
      "R-CUBED prioritizes integration adoption through continuous knowledge transfer of the ‘know how’ "
      "to sustain and scale. R-CUBED takes pride in its ability to prepare teams for success in the new paradigm.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _DataAnalytics extends StatelessWidget{
  const _DataAnalytics({Key? key}) : super(key: key);
  
  static const heading = "Data Availability & Analytics";
  static const description =
      "R-CUBED constructs an architecture that enables enterprise analytic platforms by having ready access to quality data. "
      "Ready access to data and data quality is essential to adjust strategy and remain competitive in your ever-evolving market. "
      "This data foundation allows business to make better, faster, data-driven decisions and flex to market changes.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
  
}