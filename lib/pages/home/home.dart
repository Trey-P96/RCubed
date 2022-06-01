import 'package:rcubed/content/home_content.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/navigation_bar/nav_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/RcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
      logoPath,
      color: MyTheme().primary,
      width: 200,
    );
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (c, i) => Padding(
              padding: EdgeInsets.only(top: 40),
              child: logo,
            ),
          ),
        ),
      ],
    );
  }
}
