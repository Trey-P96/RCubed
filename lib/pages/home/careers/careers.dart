
import 'package:flutter/material.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';

import '../../../widgets/embedded_web_page/embedded_web_page.dart';

class Careers extends StatelessWidget{
  const Careers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        Expanded(
          child: Container(
            color: RCubedTheme.primary,
            child: const EmbeddedWebPage(url: "https://rcubed.bamboohr.com/jobs/",),
          ),
        ),
        AppBar(
          elevation: 5,
          backgroundColor: RCubedTheme.primary,
          title: const Center(child: RcubedText("Careers")),
        ),
      ],
    );
  }

}