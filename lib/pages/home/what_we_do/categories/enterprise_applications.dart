
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/page_category/page_category.dart';

class EnterpriseApplications extends StatelessWidget {
  const EnterpriseApplications({Key? key}) : super(key: key);

  static const enterpriseAppSVG = "assets/images/what_we_do/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.blue, height: 900,);
    return const PageCategory(titlePath: enterpriseAppSVG, description: description);
  }
}
