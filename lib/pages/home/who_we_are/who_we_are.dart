
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:rcubed/widgets/custom_column/custom_column.dart';
import 'package:rcubed/widgets/nested_navbar/nested_navbar.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../network_images/network_images.dart';
import '../../../themes/rcubed_theme.dart';
import '../../../widgets/custom_appbar/custom_appbar.dart';
import '../what_we_do/categories/cloud_computing.dart';
import '../what_we_do/categories/co_sourcing.dart';
import '../what_we_do/categories/enterprise_applications.dart';
import '../what_we_do/categories/integration_architecture.dart';
import '../what_we_do/categories/managed_services.dart';
import 'employee_profile/employee_profile.dart';


class WhoWeAre extends StatelessWidget{
  static const headerSvgPath = "assets/images/who_we_are/who_we_are.svg";
  static const summary =
      "We do things differently - retooling the consulting model way. It's not about billables, "
      "big attitudes, & political capital. The R-CUBED way is about doing what is right and helping "
      "realize business values & outcomes together.";
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiSliver(children: [
    Header(
          headingUrl: Images.whoWeAre,
          summary: summary,
          navButtons: const [
            NavButton(text: "Leadership"),
            NavButton(text: "Values"),
          ]),

      const _Body(),

    ]);
  }

}


class _Body extends StatelessWidget{
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverStack(children: [
      SliverPositioned.fill(child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Shades.swatch5.withOpacity(0.9), Shades.darkGrey.withOpacity(0.9)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),)),
      MultiSliver(children: [
        // SliverToBoxAdapter(child: EmployeeProfile(name: 'Rita Popp', position: 'Principal & Founder', imgUrl: Employees.ritaPopp,),),
        // SliverToBoxAdapter(child: EmployeeProfile(name: 'Jim Williams', position: 'Principal & Founder', imgUrl: Employees.jimWilliams,),),
        // SliverToBoxAdapter(child: EmployeeProfile(name: 'Mark Hoxmeier', position: 'Principal & Founder', imgUrl: Employees.markHowmeier,),),

        SliverToBoxAdapter(child: Wrap(
          alignment:WrapAlignment.center,
          children: [
          EmployeeProfile(name: 'Rita Popp', position: 'Principal & Founder', imgUrl: Employees.ritaPopp,),
          EmployeeProfile(name: 'Jim Williams', position: 'Principal & Founder', imgUrl: Employees.jimWilliams,),
          EmployeeProfile(name: 'Yasser Abdelrahim', position: 'Technology Services', imgUrl: Employees.yasserAbdelrahim,),
          EmployeeProfile(name: 'Naveen Kesavalu', position: 'CPM Practice', imgUrl: Employees.naveenKesavalu,),
          EmployeeProfile(name: 'Mark Hoxmeier', position: 'PMO Practice', imgUrl: Employees.markHowmeier,),
          EmployeeProfile(name: 'Steve Murphy', position: 'Oracle Practice', imgUrl: Employees.steveMurphy,),
          EmployeeProfile(name: 'Donna Draper', position: 'Talent Acquisition', imgUrl: Employees.donnaDraper,),
        ],),)

      ]),
    ]);
  }

}




// class WhoWeAre extends ConsumerWidget{
//   const WhoWeAre({Key? key}) : super(key: key);
//   static const leadershipHeading = "assets/images/who_we_are/leadership.svg";
//   static const headerSvgPath = "assets/images/who_we_are/who_we_are.svg";
//   static const summary =
//       "We do things differently - retooling the consulting model way. It's not about billables, "
//       "big attitudes, & political capital. The R-CUBED way is about doing what is right and helping "
//       "realize business values & outcomes together.";
//
//   @override
//   Widget build(BuildContext context, ref) {
//     // TODO: implement build
//     return RepaintBoundary(
//       child: Container(
//         key: ref.watch(whoWeAreProvider),
//         decoration: BoxDecoration(gradient: LinearGradient(colors:[Shades.swatch5.withOpacity(0.9), Colors.black.withOpacity(0.9)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: const MaterialColumn(
//             children: [
//               // NestedNavBar(
//               //     headerSvgPath: headerSvgPath,
//               //     summary: summary,
//               //     menuButtons: [
//               //       MenuButton(title: "Leadership", ),
//               //       MenuButton(title: "Values", ),
//               //     ],
//               // ),
//               CubedHeading(path: leadershipHeading, topPadding: 60,),
//               EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
//               EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
//               EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
//               EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
//               EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
//               EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
//               EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
//               EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
//               EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
//               EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
//               EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
//               EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
//               EmployeeProfile(name: "Jim Williams", position: "Principal & Founder",),
//               EmployeeProfile(name: "Rita Popp", position: "Principal & Founder",),
//               EmployeeProfile(name: "Yasser Abderlrahim", position: "Head of Technology Services",),
//             ]
//         ),
//       ),
//     );
//   }
//
// }



