import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';

import '../../themes/theme.dart';
import '../../widgets/navigation_bar/nav_bar.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        Expanded(
          child: ListView.builder(
              controller: ScrollController(),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, i) {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Logo(200),
                );
              }),
        ),
      ],
    );
  }
}
