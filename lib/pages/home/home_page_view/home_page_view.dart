
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../network_images/network_images.dart';
import '../../../widgets/logo/logo_complete.dart';

class HomePageView extends StatelessWidget{
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(    // HOME PAGE LOGO
      height: MediaQuery.of(context).size.height-56,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //BackgroundVideo(),
          CachedNetworkImage(imageUrl: Images.homeLogoBackground, fit: BoxFit.cover,),
          const CompleteLogo(),
        ],
      ),
    );
  }

}