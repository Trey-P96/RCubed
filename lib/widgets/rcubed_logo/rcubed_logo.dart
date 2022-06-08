
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/theme.dart';

class Logo extends StatelessWidget{
  final double padding;
  const Logo(this.padding,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        'assets/images/RcubedLogo.svg',
        color: MyTheme().primary.withOpacity(1),
      ),
    );;
  }

}