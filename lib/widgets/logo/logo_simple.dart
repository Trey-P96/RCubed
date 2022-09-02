
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/rcubed_theme.dart';

class Logo extends StatelessWidget{
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SvgPicture.asset("assets/images/RcubedLogo.svg",
        color: RCubedTheme.secondary);
  }

}