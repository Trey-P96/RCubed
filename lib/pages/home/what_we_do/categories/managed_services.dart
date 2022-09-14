
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';

import '../../../../themes/rcubed_theme.dart';
import '../../../../widgets/description_box/description_box.dart';

class ManagedServices extends StatelessWidget {
  const ManagedServices({Key? key}) : super(key: key);

  static const svgPath = "assets/images/what_we_do/categories/managed_services/managed_services.svg";
  static const summary =
      "R-CUBED optimizes user experience in a cost-efficient manner enabling scalability and responsibly "
      "troubleshooting to resolve pain points. Let your talent focus on strategic initiatives, revenue-generating "
      "activities, and innovation.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpandingBox(
        svgPath: svgPath,
        summary: summary,
        color: Shades.swatch2,
        buttonColor: Colors.white,
        buttonTextColor: Colors.black,
        expanded: Column(
          children: const [
            _InfStrctMngmt(),
            _OpMngmt(),
            _AppMngmt(),
            _QltyMngmt(),
          ],
        ));
  }
}


class _InfStrctMngmt extends StatelessWidget{
  const _InfStrctMngmt({Key? key}) : super(key: key);

  static const heading = "Infrastructure Management";
  static const description =
      "Let’s boost and maintain your infrastructure so you can focus on what matters to your core business. "
      "R-CUBED manages your environments and systems whether in the cloud, on premise, or blended. We specialize "
      "in enterprise applications and integration platforms. We cover end-to-end infrastructure management: administration, "
      "monitoring &amp; maintenance. ";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _OpMngmt extends StatelessWidget{
  const _OpMngmt({Key? key}) : super(key: key);

  static const heading = "Operations Management";
  static const description =
      "R-CUBED puts the user experience at the center of our unified support delivery model. We measure our success on "
      "user experience. R-CUBED is proactively responsive, attentive to priority, and mindful of cycle times throughout "
      "the service request lifecycle. We are seasoned domain and product experts offering 24x7x365 service.";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}


class _AppMngmt extends StatelessWidget{
  const _AppMngmt({Key? key}) : super(key: key);

  static const heading = "Applications Management";
  static const description =
      "R-CUBED manages your application portfolio so you can shift focus to more strategic initiatives. We thrive on keeping "
      "business operating and optimized 24x7x365. Our delivery method is fit to your specific needs whether on-shore, off-shore, "
      "or blended. We specialize in enterprise applications and integration platforms covering administration, functional support "
      "&amp; development. ";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _QltyMngmt extends StatelessWidget{
  const _QltyMngmt({Key? key}) : super(key: key);

  static const heading = "Quality Management";
  static const description =
      "Don’t let resource contention delay you from keeping up to date with the latest software releases. Tap into  R-CUBED’s domain "
      "experts to manage, execute, and harmonize your quality assurance process. Our agile, automated, risk-based approach and quality "
      "assurance framework yields shorter test release cycles while achieving higher quality standards giving you the confidence you need "
      "to keep current with evolving technology capability. We specialize in pre &amp; post implementation assessment, system test strategy "
      "&amp; plan, and test script creation &amp; execution covering enterprise application and integration platforms. ";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}
