
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:rcubed/widgets/custom_column/custom_column.dart';
import 'package:rcubed/widgets/nested_navbar/nested_navbar.dart';

import '../../../themes/rcubed_theme.dart';
import '../../../widgets/custom_appbar/custom_appbar.dart';
import '../what_we_do/categories/cloud_computing.dart';
import '../what_we_do/categories/co_sourcing.dart';
import '../what_we_do/categories/enterprise_applications.dart';
import '../what_we_do/categories/integration_architecture.dart';
import '../what_we_do/categories/managed_services.dart';
import 'employee_profile/employee_profile.dart';

class WhoWeAre extends ConsumerWidget{
  const WhoWeAre({Key? key}) : super(key: key);
  static const leadershipHeading = "assets/images/who_we_are/leadership.svg";

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Container(
      key: ref.watch(whoWeAreProvider),
      decoration: BoxDecoration(gradient: LinearGradient(colors:[Shades.swatch5.withOpacity(0.9), Colors.black.withOpacity(0.9)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: const MaterialColumn(
          children: [
            NestedNavBar(
                title: "Who We Are",
                menuButtons: [
                  MenuButton(title: "Leadership", ),
                  MenuButton(title: "Values", ),
                ],
            ),
            CubedHeading(path: leadershipHeading, topPadding: 60,),
            EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
            EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
            EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
          ]
      ),
    );
  }

}