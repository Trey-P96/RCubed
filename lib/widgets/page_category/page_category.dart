
import 'package:flutter/material.dart';
import '../cubed_heading/cubed_heading.dart';
import '../description_box/description_box.dart';
import '../themed_button/themed_button.dart';

class PageCategory extends StatelessWidget{
  final String titlePath, description;
  const PageCategory({required this.titlePath, required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const ExpandingBox();
  }

}

class ExpandingBox extends StatefulWidget{
  const ExpandingBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpandingBoxState();
  }
}

class ExpandingBoxState extends State<ExpandingBox>{
  bool _isExpanded = false;

  static const enterpriseAppSVG = "assets/images/what_we_do/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSize(
        alignment: Alignment.topCenter,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        child: !_isExpanded? Container(
          color: Colors.blue.withOpacity(0.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CubedHeading(path: enterpriseAppSVG),
              const DescriptonBox(description: description),
              //ExpandedChild(key: GlobalKey(), title: titlePath,),
              ThemedButton(label: "Learn More", onPressed: (){setState((){
                _isExpanded = true;
              });},),
            ],
          )
        ): Container(
          color: Colors.blue.withOpacity(0.9),
          height: 900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CubedHeading(path: enterpriseAppSVG),
              const DescriptonBox(description: description),
              //ExpandedChild(key: GlobalKey(), title: titlePath,),
              ThemedButton(label: "Learn More", onPressed: (){setState((){
                _isExpanded = false;
              });},),
            ],
          ),
        )
    );
  }

}



class TestWidget extends StatelessWidget{
  const TestWidget({Key? key}) : super(key: key);

  static const enterpriseAppSVG = "assets/images/what_we_do/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ColoredBox(
      color: Colors.blue.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          CubedHeading(path: enterpriseAppSVG),
          DescriptonBox(description: description),
          DescriptonBox(description: description),
          DescriptonBox(description: description),
          //ExpandedChild(key: GlobalKey(), title: titlePath,),
          //LearnMore(title: enterpriseAppSVG,),
        ],
      ),
    );
  }

}