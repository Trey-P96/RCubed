
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:rcubed/widgets/custom_column/custom_column.dart';
import 'package:rcubed/widgets/nested_navbar/nested_navbar.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../emloyee_info/employee_info.dart';
import '../../../../network_images/network_images.dart';
import '../../../../themes/fonts.dart';
import '../../../../themes/rcubed_theme.dart';
import 'employee_profile/employee_profile.dart';


StateProvider<GlobalKey> valuesKey = StateProvider((ref) => GlobalKey());
StateProvider<GlobalKey> leadershipKey = StateProvider((ref) => GlobalKey());


class WhoWeAre extends ConsumerWidget{
  static const leadershipHeading = "assets/images/who_we_are/leadership.svg";
  static const valuesHeading = "assets/images/who_we_are/values.svg";
  static const headerSvgPath = "assets/images/who_we_are/who_we_are_flat.svg";
  static const summary =
      "We do things differently - retooling the consulting model way. It's not about billables, "
      "big attitudes, & political capital. The R-CUBED way is about doing what is right and helping "
      "realize business values & outcomes together.";
  static const values = "Our core values guide our compass & sets the tone for the way we work. We believe culture is everything to attract & retain the right talent, drive client advocacy & forge the right alliances.";
  const WhoWeAre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return MultiSliver(children: const [
    Header(
          headingUrl: headerSvgPath,
          summary: summary,
          navButtons: [
            // NavButton(text: "Values", indexKey: ref.watch(valuesKey),),
            // NavButton(text: "Leadership", indexKey: ref.watch(leadershipKey),),
          ]),

      _Body(),

    ]);
  }

}


class _Body extends ConsumerWidget{
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return SliverStack(children: [
      SliverPositioned.fill(child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Shades.swatch8.withOpacity(0.95), Shades.darkGrey.withOpacity(0.95)], begin: Alignment.topCenter, end: Alignment.bottomCenter)),)),

      MultiSliver(children: [

        SliverToBoxAdapter(key: ref.watch(leadershipKey),child: const CubedHeading(path: WhoWeAre.leadershipHeading, topPadding: 60,),),

        SliverToBoxAdapter(child: Wrap(
          alignment:WrapAlignment.center,
          children: [
            EmployeeProfile(name: 'Jim Williams', position: 'CEO & Co-Founder', bio: JimWilliams.bio, imgUrl: Employees.jimWilliams,),
            EmployeeProfile(name: 'Rita Popp', position: 'COO & Co-Founder', bio: RitaPopp.bio, imgUrl: Employees.ritaPopp,),
            EmployeeProfile(name: 'Yasser Abdelrahim', position: 'Technology & Data Management', bio: YasserA.bio, imgUrl: Employees.yasserAbdelrahim,),
            EmployeeProfile(name: 'Naveen Kesavalu', position: 'CPM Practice', bio: NaveenK.bio, imgUrl: Employees.naveenKesavalu,),
            EmployeeProfile(name: 'Mark Hoxmeier', position: 'PMO Practice', bio: MarkH.bio, imgUrl: Employees.markHowmeier,),
            //EmployeeProfile(name: 'Steve Murphy', position: 'Oracle Practice', bio: SteveM.bio, imgUrl: Employees.steveMurphy,),
            EmployeeProfile(name: 'Donna Draper', position: 'Talent Acquisition', bio: DonnaD.bio,imgUrl: Employees.donnaDraper,),
        ],),),

        SliverToBoxAdapter(child: Container(height: 1, color: Colors.white,),),


        SliverToBoxAdapter(key: ref.watch(valuesKey),child: const CubedHeading(path: WhoWeAre.valuesHeading, topPadding: 60,),),

        SliverToBoxAdapter(child: Align(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
            child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 800),
                child: const SelectableText.rich(TextSpan(text: WhoWeAre.values, style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 2, height: 2, fontFamily: DefaultFonts.kumbhsans)),)),
          ),
        ),),

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



