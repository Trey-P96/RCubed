
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/theme.dart';

class Logo extends StatelessWidget{
  final double size;
  const Logo(this.size,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SvgPicture.asset(
      'assets/images/RcubedLogo.svg',
      color: MyTheme().primary,
      width: size,
    );;
  }

}