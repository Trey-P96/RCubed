
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/theme.dart';

class Logo extends StatelessWidget{
  final double padding;
  const Logo({this.padding=0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(
              'assets/images/RCubedLogoFinalized.svg',
              height: 400,
              //color: MyTheme.primary.withOpacity(1),
            ),
      ),


    );
  }

}