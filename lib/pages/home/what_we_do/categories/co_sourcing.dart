import 'package:flutter/material.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';

import '../../../../themes/rcubed_theme.dart';

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
