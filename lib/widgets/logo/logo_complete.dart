
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/rcubed_theme.dart';

class CompleteLogo extends StatelessWidget{
  const CompleteLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SvgPicture.asset("assets/images/RCubedLogoFinalized.svg"),
        ),
      ),
    );
  }

}