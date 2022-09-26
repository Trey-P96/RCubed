
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:rcubed/widgets/description_box/description_box.dart';
import 'package:rcubed/widgets/expanding_box/expanding_box.dart';

class EnterpriseApplications extends StatelessWidget {
  const EnterpriseApplications({Key? key}) : super(key: key);

  static const enterpriseAppSVG = "assets/images/what_we_do/categories/enterprise_applications/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //
    return ExpandingBox(
      svgPath: enterpriseAppSVG,
      summary: description,
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
    return const DescriptionBox(description: description, heading: "System Select");
  }
}

class _SystemDiagnStrat extends StatelessWidget{
  const _SystemDiagnStrat({Key? key}) : super(key: key);
  static const heading = "System Diagnostic Strategy";
  static const description =
      "Let R-CUBED baseline your current application landscape and position opportunities and considerations for "
      "modernization. We will team with you to develop a business case and time-phased strategic roadmap to migrate "
      "and/or enhance your enterprise application footprint aligning to operational strategy and initiatives.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _MasterDataGov extends StatelessWidget{
  const _MasterDataGov({Key? key}) : super(key: key);

  static const heading = "Master Data Governance";
  static const description =
      "R-CUBED supports organizations in cleansing historical data through classification &amp; enrichment methods and "
      "helps manage on-going data quality using our comprehensive data governance model. Managed and governed master data "
      "is vital to unified transactional efficiency. It establishes your basis for complete &amp; consistent data improving"
      " automation, enhancing data accuracy, increasing systemic controls, and enabling analytical insights.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}

class _EnterpriseRsrcPln extends StatelessWidget{
  const _EnterpriseRsrcPln({Key? key}) : super(key: key);

  static const heading = "Enterprise Resource Planning";
  static const description =
      "R-CUBED is a change catalyst to the way people work through digital enablement driving efficiency, data "
      "accessibility, performance improvement, and adoption today and beyond. Our agile, value-focused, and ‘Client "
      "In’ methodology helps you re-envision the achievable for your enterprise application portfolio and realize "
      "operational potential.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}


class _CorpPerfMngmt extends StatelessWidget{
  const _CorpPerfMngmt({Key? key}) : super(key: key);

  static const heading = "Corporate Performance Management";
  static const description =
      "R-CUBED’s digital enablement model and methods unleash business performance management eliminating data silos, sunsetting manual "
      "spreadsheets, and re-directs focus on critical analysis and decision making. Our experience with extensible CPM platforms enables "
      "extended planning and analysis (xP&A) for unified, on-demand financial planning, forecasting, modeling, and operations planning "
      "across lines of business as a collaborative process. We help organizations focus on what matters with nimbleness, simplification, and "
      "increase speed-to-value across Finance, Supply Chain &amp; Customer Experience.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}



class _EnterpriseAnyltcs extends StatelessWidget{
  const _EnterpriseAnyltcs({Key? key}) : super(key: key);

  static const heading = "Enterprise Analytics";
  static const description =
      "R-CUBED delivers real data-driven enterprise decision capability using holistic analytic strategies and resilient "
      "architecture. We help you deploy an agile analytics model to make well informed data-backed decisions that strengthen "
      "business results. We specialize in Human Capital Management, Supply Chain Management and Finance Analytics.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const DescriptionBox(description: description, heading: heading);
  }
}