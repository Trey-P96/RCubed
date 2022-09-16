
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/pages/home/home.dart';

import '../../../widgets/custom_appbar/custom_appbar.dart';
import '../../../widgets/custom_column/custom_column.dart';
import '../../../widgets/nested_navbar/nested_navbar.dart';
import 'categories/cloud_computing.dart';
import 'categories/co_sourcing.dart';
import 'categories/enterprise_applications.dart';
import 'categories/integration_architecture.dart';
import 'categories/managed_services.dart';
import 'categories/technologies.dart';

class WhatWeDo extends ConsumerWidget{
  const WhatWeDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return MaterialColumn(
      key: ref.watch(whatWeDoProvider),
      children: [
        const NestedNavBar(
          title: "What We Do",
          menuButtons: [
            MenuButton(title: "Enterprise Applications", ),
            MenuButton(title: "Integration Architecture", ),
            MenuButton(title: "Cloud Computing",),
            MenuButton(title: "Managed Services",),
            MenuButton(title: "Co Sourcing", ),
            MenuButton(title: "Technologies", ),
          ],
        ),
        const EnterpriseApplications(),
        const IntegrationArchitecture(),
        const CloudComputing(),
        const ManagedServices(),
        const CoSourcing(),
        Technologies(key: key),
      ],
    );
  }

}



