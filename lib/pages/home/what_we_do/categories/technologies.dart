import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../network_images/network_images.dart';
import '../../../../themes/fonts.dart';
import '../../../../widgets/cubed_heading/cubed_heading.dart';
import '../../../../widgets/custom_sliver_list/custom_sliver_list.dart';



class TechExpandingBox extends StatelessWidget{
  final Color color;
  const TechExpandingBox({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverStack(children: [
      SliverPositioned.fill(child: RepaintBoundary(
        child: Material(
          elevation: 10,
          child: Stack(
            children: [
              Positioned.fill(child: CachedNetworkImage(imageUrl: Images.motherBoard, fit: BoxFit.cover,),),
              Container(color: color.withOpacity(0.9),)
            ],
          ),
        ),
      )),
      MultiSliver(children: [
        const SliverToBoxAdapter(
          child: CubedHeading(path: Technologies.svgPath,bottomPadding: 10, topPadding: 60,),),

        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Align(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(text: Technologies.summary,
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




class Technologies extends StatelessWidget {
  const Technologies({Key? key}) : super(key: key);

  static const svgPath = "assets/images/what_we_do/categories/technologies/technologies.svg";
  static const summary =
      "We specialize & bring together leading technology solutions & smart ways of working to "
      "shape your digital strategy to deliver tangible business outcomes.\n\nWe are 'One Think Ahead'.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ExpandingBox(
      svgPath: svgPath,
      summary: summary,
      expanded: SizedBox(),
      isExpandable: false,
      color: Shades.swatch4,
    );
  }
}
