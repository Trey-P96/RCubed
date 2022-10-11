
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:overflow_view/overflow_view.dart';
import 'package:rcubed/pages/home/what_we_do/categories/cloud_computing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/co_sourcing.dart';
import 'package:rcubed/pages/home/what_we_do/categories/enterprise_applications.dart';
import 'package:rcubed/pages/home/what_we_do/categories/managed_services.dart';
import 'package:rcubed/pages/home/what_we_do/categories/technologies.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/column_builder/column_builder.dart';
import 'package:rcubed/widgets/custom_sliver_list/custom_sliver_list.dart';
import 'package:rcubed/widgets/device_listener/device_listener.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:sliver_tools/sliver_tools.dart';


import 'package:rcubed/widgets/nested_navbar/nested_navbar.dart';

import '../../../network_images/network_images.dart';
import '../../../widgets/text_builder/text_builder.dart';
import 'categories/integration_architecture.dart';

StateProvider<GlobalKey> enterpriseAppKey = StateProvider<GlobalKey>((ref) => GlobalKey());
StateProvider<GlobalKey> intArchKey = StateProvider<GlobalKey>((ref) => GlobalKey());
StateProvider<GlobalKey> cloudCmptKey = StateProvider<GlobalKey>((ref) => GlobalKey());
StateProvider<GlobalKey> mngSrvcKey = StateProvider<GlobalKey>((ref) => GlobalKey());
StateProvider<GlobalKey> coSrcKey = StateProvider<GlobalKey>((ref) => GlobalKey());
StateProvider<GlobalKey> technologiesKey = StateProvider<GlobalKey>((ref) => GlobalKey());

class WhatWeDo extends ConsumerWidget{
  static String summary =
  '''We transform the way people work by putting clients at the center of business solutions. Our disruptive model converts possibilities into real business value. Let’s build a better tomorrow.''';

  const WhatWeDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return MultiSliver(children: [
      Header(
          headingUrl: Images.whatWeDo,
          summary: WhatWeDo.summary,
          navButtons: [
            NavButton(text: "Enterprise Applications", indexKey: ref.watch(enterpriseAppKey),),
            NavButton(text: "Integration Architecture", indexKey: ref.watch(intArchKey),),
            NavButton(text: "Cloud Computing", indexKey: ref.watch(cloudCmptKey),),
            NavButton(text: "Managed Services", indexKey: ref.watch(mngSrvcKey),),
            NavButton(text: "Co-Sourcing", indexKey: ref.watch(coSrcKey),),
            NavButton(text: "Technologies", indexKey: ref.watch(technologiesKey),),
          ]),

      EntPrseExpandingBox(key: ref.watch(enterpriseAppKey),color: Colors.blue),
      IntArchExpandingBox(key: ref.watch(intArchKey),color: Palette.darkBlueShade),
      CloudCmptExpandingBox(key: ref.watch(cloudCmptKey), color: Shades.swatch1),
      MngSrvceExpandingBox(key: ref.watch(mngSrvcKey),color: Shades.swatch2),
      CoSrcExpandingBox(key: ref.watch(coSrcKey),color: Shades.swatch7),
      TechExpandingBox(key: ref.watch(technologiesKey),color: Shades.swatch4,),
    ]);
  }
}

















class DebugWidget extends StatelessWidget{
  final String text;
  const DebugWidget({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build");
    // TODO: implement build
    return Text(text);
  }

}




























class WhatWeDoNavBar extends StatelessWidget{
  const WhatWeDoNavBar({Key? key}) : super(key: key);
  static const headerSvgPath = "assets/images/what_we_do/what_we_do.svg";
  static const summary =
      '''xc RichText version Semantic Index false transform the way people work by putting clients at the center of business solutions. Our disruptive model converts possibilities into real business value. Let’s build a better tomorrow.''';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return const Material(
      elevation: 10,
      child: NestedNavBar(
        headerSvgPath: headerSvgPath,
        summary: summary,
        menuButtons: [
          // MenuButton(title: "Enterprise Applications", ),
          // MenuButton(title: "Integration Architecture", ),
          // MenuButton(title: "Cloud Computing",),
          // MenuButton(title: "Managed Services",),
          // MenuButton(title: "Co Sourcing", ),
          // MenuButton(title: "Technologies", ),
        ],
      ),
    );
  }

}



