import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';

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
