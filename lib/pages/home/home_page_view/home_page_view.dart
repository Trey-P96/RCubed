
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/home.dart';

import '../../../network_images/network_images.dart';
import '../../../widgets/logo/logo_complete.dart';

class HomePageView extends ConsumerWidget{
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return SizedBox(
      key: ref.watch(homePageProvider),// HOME PAGE LOGO
      height: MediaQuery.of(context).size.height-56,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(imageUrl: Images.homeLogoBackground, fit: BoxFit.cover,),
          const CompleteLogo(),
        ],
      ),
    );
  }

}