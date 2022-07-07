
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/theme.dart';

class Logo extends StatelessWidget{

  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SvgPicture.asset(
      'assets/images/RcubedLogo.svg',
      height: 300,
      color: MyTheme.primary.withOpacity(1),
    );
  }

}