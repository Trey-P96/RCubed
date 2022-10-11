import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../network_images/network_images.dart';
import '../../../../themes/fonts.dart';
import '../../../../themes/rcubed_theme.dart';
import '../../../../widgets/cubed_heading/cubed_heading.dart';
import '../../../../widgets/custom_sliver_list/custom_sliver_list.dart';


class CoSrcExpandingBox extends StatelessWidget{
  final Color color;
  const CoSrcExpandingBox({Key? key, required this.color}) : super(key: key);

  List<Widget> slivers(){
    return [


      SliverStack(children: [
        SliverPositioned.fill(child: ColoredBox(color: color.withOpacity(0.95),)),
        MultiSliver(children: [
          const SliverToBoxAdapter(
            child: CubedHeading(path: CoSourcing.svgPath,bottomPadding: 20,),),

          CustomSliverBuilder(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(text: CoSourcing.summary,
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
              Positioned.fill(child: CachedNetworkImage(imageUrl: Images.lightBulbs, fit: BoxFit.cover,),),
              Container(color: color.withOpacity(0.95),)
            ],
          ),
        ),
      )),
      MultiSliver(children: [
        const SliverToBoxAdapter(
          child: CubedHeading(path: CoSourcing.svgPath,bottomPadding: 10, topPadding: 60,),),

        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Align(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(text: CoSourcing.summary,
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





class CoSourcing extends StatelessWidget {
  const CoSourcing({Key? key}) : super(key: key);

  static const svgPath = "assets/images/what_we_do/categories/co_sourcing/co_sourcing.svg";
  static const summary =
      "We take pride in placing the right talent to be impactful and additive to your team. Our resource pool has a "
      "breadth of technology, business process, and program management expertise across multiple industry verticals "
      "to serve as an asset and key contributor to your team.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ExpandingBox(
        svgPath: svgPath,
        summary: summary,
        color: Shades.swatch3,
        isExpandable: false,
        expanded: SizedBox(),
    );
  }
}
