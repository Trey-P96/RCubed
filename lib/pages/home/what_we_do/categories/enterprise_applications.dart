
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';
import 'package:rcubed/widgets/page_category/page_category.dart';

import '../../../../themes/fonts.dart';
import '../../../../themes/rcubed_theme.dart';
import '../../../../widgets/cubed_heading/cubed_heading.dart';
import '../../../../widgets/description_box/description_box.dart';

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
    return ExpandingBox(
      header: const _EnterpriseAppHeader(),
      expanded: Column(children: const [
        _SystemSelect(),
        _SystemDiagnStrat(),
        _MasterDataGov(),
        _EnterpriseRsrcPln(),
        _CorpPerfMngmt(),
        _EnterpriseAnyltcs(),
      ],),
      buttonColor: Colors.white,
      buttonTextColor: Colors.black,
    );
  }
}




class _EnterpriseAppHeader extends StatelessWidget{
  const _EnterpriseAppHeader({Key? key}) : super(key: key);

  static const enterpriseAppSVG = "assets/images/what_we_do/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisSize: MainAxisSize.max,
      children: const [
        CubedHeading(path: enterpriseAppSVG),
        DescriptonBox(description: description),

      ],
    );
  }

}













class _SystemSelect extends StatelessWidget{
  const _SystemSelect({Key? key}) : super(key: key);

  static const description =
      "Whether you are closing the gap of technical debt, unifying your transaction processing & master data to "
      "leverage your data as an asset, or looking to maximize your IT investment, R-CUBED enables you to select "
      "the right fit-for-purpose solutions. We specialize in business ready applications across Enterprise Resource "
      "Planning, Corporate Performance Management, Enterprise Analytics, and Human Capital Management.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'System Select',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}




class _SystemDiagnStrat extends StatelessWidget{
  const _SystemDiagnStrat({Key? key}) : super(key: key);

  static const description =
      "Let R-CUBED baseline your current application landscape and position opportunities and considerations for "
      "modernization. We will team with you to develop a business case and time-phased strategic roadmap to migrate "
      "and/or enhance your enterprise application footprint aligning to operational strategy and initiatives.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'System Diagnostic & Strategy',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}





class _MasterDataGov extends StatelessWidget{
  const _MasterDataGov({Key? key}) : super(key: key);

  static const description =
      "R-CUBED supports organizations in cleansing historical data through classification &amp; enrichment methods and "
      "helps manage on-going data quality using our comprehensive data governance model. Managed and governed master data "
      "is vital to unified transactional efficiency. It establishes your basis for complete &amp; consistent data improving"
      " automation, enhancing data accuracy, increasing systemic controls, and enabling analytical insights.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'Master Data Governance',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}





class _EnterpriseRsrcPln extends StatelessWidget{
  const _EnterpriseRsrcPln({Key? key}) : super(key: key);

  static const description =
      "R-CUBED is a change catalyst to the way people work through digital enablement driving efficiency, data "
      "accessibility, performance improvement, and adoption today and beyond. Our agile, value-focused, and ‘Client "
      "In’ methodology helps you re-envision the achievable for your enterprise application portfolio and realize "
      "operational potential.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'Enterprise Resource Planning',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}




class _CorpPerfMngmt extends StatelessWidget{
  const _CorpPerfMngmt({Key? key}) : super(key: key);

  static const description =
      "R-CUBED’s digital enablement model and methods unleash business performance management eliminating data silos, sunsetting manual "
      "spreadsheets, and re-directs focus on critical analysis and decision making. Our experience with extensible CPM platforms enables "
      "extended planning and analysis (xP&A) for unified, on-demand financial planning, forecasting, modeling, and operations planning "
      "across lines of business as a collaborative process. We help organizations focus on what matters with nimbleness, simplification, and "
      "increase speed-to-value across Finance, Supply Chain &amp; Customer Experience.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'Corporate Performance Management',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}






class _EnterpriseAnyltcs extends StatelessWidget{
  const _EnterpriseAnyltcs({Key? key}) : super(key: key);

  static const description =
      "R-CUBED delivers real data-driven enterprise decision capability using holistic analytic strategies and resilient "
      "architecture. We help you deploy an agile analytics model to make well informed data-backed decisions that strengthen "
      "business results. We specialize in Human Capital Management, Supply Chain Management and Finance Analytics.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 1000
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Heading(heading: 'Enterprise Analytics',),
            RcubedText(description, isBlockBody: true,),
          ],
        ),
      ),
    );
  }
}








class _Heading extends StatelessWidget{
  final String heading;
  const _Heading({required this.heading, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(alignment: Alignment.centerLeft, child:
    Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(height: 40, decoration: BoxDecoration(color: Palette.darkerBlueShade, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: RcubedText(heading, fontFamily: DefaultFonts.kumbhsans,),
        ),
      ),
    ));
  }}