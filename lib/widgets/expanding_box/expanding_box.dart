

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import '../../providers/animated_container_provider.dart';
import '../themed_button/themed_button.dart';





class ExpandingBox extends StatelessWidget{

  static const enterpriseAppSVG = "assets/images/what_we_do/enterprise_applications.svg";
  static const description =
      "   R-CUBED provides solutions across the end-to-end application journey. "
      "We maximize potential by shaping your digital strategy with deliberate "
      "execution that fuels transformation and maximizes potential.";

  final Widget header, expanded;
  final Color color, buttonColor, buttonTextColor;
  final String buttonText, shrinkButtonText;
  const ExpandingBox({
    required this.header,
    required this.expanded,
    this.color=Colors.blue,
    this.buttonText="Learn More",
    this.shrinkButtonText="Minimize",
    this.buttonTextColor=Colors.white,
    this.buttonColor=RCubedTheme.primary,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return ColoredBox(
      color: color.withOpacity(0.9),
      child: AnimatedSize(
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
          child: !Provider.of<AnimatedContainerProvider>(context).isExpanded()?
          _BuildHeader(
            header: header,
            buttonColor: buttonColor,
            buttonText: buttonText,
            buttonTextColor: buttonTextColor,)
              :
          _BuildExpanded(
            header: header,
            details: expanded,
            buttonTextColor: buttonTextColor,
            buttonColor: buttonColor,
            buttonText: shrinkButtonText,)
      ),
    );
  }
}


class _BuildHeader extends StatelessWidget{
  final Widget header;
  final Color buttonColor, buttonTextColor;
  final String buttonText;
  const _BuildHeader({
    required this.header,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        header,
        ThemedButton(label: buttonText, textColor: buttonTextColor, onPressed: (){
          Provider.of<AnimatedContainerProvider>(context,listen: false).expand();
        }, color: buttonColor,),
      ],
    );
  }

}





class _BuildExpanded extends StatefulWidget{
  final Widget header, details;
  final Color buttonColor, buttonTextColor;
  final String buttonText;

  const _BuildExpanded({required this.buttonColor,
    required this.buttonText,
    required this.buttonTextColor,
    required this.header,
    required this.details,
    Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BuildExpandedState();
  }
}

class _BuildExpandedState extends State<_BuildExpanded> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AnimatedContainerProvider>(context, listen: false)
          .setOpacity(1);
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.header,
        AnimatedOpacity(
          opacity: Provider.of<AnimatedContainerProvider>(context)
              .getOpacity(),
          duration: const Duration(seconds: 1),
          child: Column(children: [
            widget.details,
            ThemedButton(
              label: widget.buttonText,
              color: widget.buttonColor,
              textColor: widget.buttonTextColor,
              onPressed: () {
                Provider.of<AnimatedContainerProvider>(
                    context, listen: false).setOpacity(0);
                Provider.of<AnimatedContainerProvider>(
                    context, listen: false).expand();
              },
            ),
          ],),
        )

      ],
    );
  }
}