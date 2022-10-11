
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../network_images/network_images.dart';
import '../../themes/rcubed_theme.dart';

class CompleteLogo extends StatelessWidget{
  const CompleteLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ConstrainedBox(constraints:const BoxConstraints(maxWidth: 600),child: CachedNetworkImage(imageUrl: Images.homeLogo,fit: BoxFit.fitWidth,)),
      ),
    );
  }

}