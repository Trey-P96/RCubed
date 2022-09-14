

import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:rcubed/widgets/cubed_heading/cubed_heading.dart';
import 'package:rcubed/widgets/description_box/description_box.dart';
import '../themed_button/themed_button.dart';



final expandedMapProvider = ChangeNotifierProvider<ExpandedMap>((ref) => ExpandedMap());
class ExpandedMap extends ChangeNotifier{
  final Map<String, bool> _expandedMap = {};
  final Map<String, double> _opacityMap = {};
  //UnmodifiableMapView<String, bool> get expandedMap=>UnmodifiableMapView(_expandedMap);

  void updateMap(String key, bool isExpanded){
    if(_expandedMap.containsKey(key)) _expandedMap.update(key, (value) => isExpanded);
    else _expandedMap.putIfAbsent(key, () => isExpanded);
    notifyListeners();
  }

  bool isExpanded(String key){
    if(_expandedMap.containsKey(key)) return _expandedMap[key]!;
    return false;
  }

  void setOpacity(String key, double opacity){
    if(_opacityMap.containsKey(key)) _opacityMap.update(key, (value) => opacity);
    else _opacityMap.putIfAbsent(key, () => opacity);
    notifyListeners();
  }

  double getOpacity(String key){
    if(_opacityMap.containsKey(key)) return _opacityMap[key]!;
    else return 0;
  }
}





class ExpandingBox extends ConsumerWidget{
  final Widget expanded;
  final Color color, buttonColor, buttonTextColor;
  final String svgPath, summary, buttonText, shrinkButtonText;
  const ExpandingBox({
    required this.svgPath,
    required this.summary,
    required this.expanded,
    this.color=Colors.blue,
    this.buttonText="Learn More",
    this.shrinkButtonText="Minimize",
    this.buttonTextColor=Colors.white,
    this.buttonColor=RCubedTheme.primary,
    Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {

    // TODO: implement build
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(expandedMapProvider).updateMap(svgPath, false);
        });
        return ColoredBox(
          color: color.withOpacity(0.9),
          child: AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 1700),
              curve: Curves.easeInOut,
              //child: !Provider.of<AnimatedContainerProvider>(context).isExpanded()?
              child:
               Consumer(
                 builder: (context, ref, child) {
                   final shouldExpand = ref.watch(expandedMapProvider).isExpanded(svgPath);
                   //if(shouldExpand!= null && shouldExpand) {
                     //print(ref.watch(expandedProvider)[svgPath]);
                     return !shouldExpand?
                     _BuildHeader(
                       svgPath: svgPath,
                       summary: summary,
                       buttonColor: buttonColor,
                       buttonText: buttonText,
                       buttonTextColor: buttonTextColor,)
                         :
                     _BuildExpanded(
                       svgPath: svgPath,
                       summary: summary,
                       details: expanded,
                       buttonTextColor: buttonTextColor,
                       buttonColor: buttonColor,
                       buttonText: shrinkButtonText,);
                 }
               )


          ),
        );
      }
    );
  }
}


class _BuildHeader extends ConsumerWidget{
  final Color buttonColor, buttonTextColor;
  final String svgPath, summary, buttonText;
  const _BuildHeader({
    required this.svgPath,
    required this.summary,
    required this.buttonText,
    required this.buttonTextColor,
    required this.buttonColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CubedHeading(path: svgPath),
        SummaryBox(description: summary),
        ThemedButton(label: buttonText, textColor: buttonTextColor, onPressed: (){
          ref.read(expandedMapProvider).updateMap(svgPath, true);
          //Provider.of<AnimatedContainerProvider>(context,listen: false).expand();
        }, color: buttonColor,),
      ],
    );
  }

}



class _BuildExpanded extends StatefulWidget{
  final Widget details;
  final Color buttonColor, buttonTextColor;
  final String svgPath, summary, buttonText;

  const _BuildExpanded({
    required this.details,
    required this.buttonColor,
    required this.svgPath,
    required this.summary,
    required this.buttonText,
    required this.buttonTextColor,
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
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CubedHeading(path: widget.svgPath),
        SummaryBox(description: widget.summary),
        Consumer(
          builder: (context, ref, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if(ref.watch(expandedMapProvider).getOpacity(widget.svgPath) == 0){
                ref.read(expandedMapProvider).setOpacity(widget.svgPath, 1);
              }
            });
            return AnimatedOpacity(
              opacity: ref.watch(expandedMapProvider).getOpacity(widget.svgPath),
              duration: const Duration(seconds: 1),
              child: Column(children: [
                widget.details,
                Consumer(
                  builder: (context, ref, child) {
                    return ThemedButton(
                      label: widget.buttonText,
                      color: widget.buttonColor,
                      textColor: widget.buttonTextColor,
                      onPressed: () {
                        ref.read(expandedMapProvider).updateMap(widget.svgPath, false);
                        ref.read(expandedMapProvider).setOpacity(widget.svgPath, 0);
                      },
                    );
                  }
                ),
              ],),
            );
          }
        )

      ],
    );
  }
}