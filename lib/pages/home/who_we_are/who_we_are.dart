

import 'package:flutter/material.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';

import '../../../themes/rcubed_theme.dart';
import '../../../widgets/employee_gridview/employee_gridview.dart';

class WhoWeAre extends StatelessWidget{
  final nestedScrollKey = GlobalKey<NestedScrollViewState>();

  WhoWeAre({Key? key}) : super(key: key);

  void scrollToIndex(GlobalKey key){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [RCubedTheme.primary.withOpacity(0.5),Palette.offWhite, ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
        //Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Images.whoWeAreInfo)),
        CustomAppbar(
            title: "Who We Are",
            navBarHeightKey: GlobalKey(),
            nestedScrollKey: nestedScrollKey,
            menuButtons: [
              MenuButton(title: "Leadership", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
              MenuButton(title: "Values", pageKey: GlobalKey(), scrollToIndex: scrollToIndex),
            ],
            body: const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: EmployeeGridView(),
            ),
        ),
      ],
    );
  }
}