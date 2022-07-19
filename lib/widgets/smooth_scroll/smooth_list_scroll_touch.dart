
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/smooth_scroll_provider.dart';

import '../../main.dart';
import 'SmoothScroll.dart';

class SmoothScrollTouch extends StatefulWidget{
  final List<Widget> children;
  final SmoothScroll parent;
  const SmoothScrollTouch({required this.children, required this.parent, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollTouchState();
  }
}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  late ScrollController _scrollController;

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: Provider.of<SmoothScrollProvider>(context,listen: false).getOffset(widget.parent));
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        Provider.of<AbsorbInput>(context, listen: false).setAbsorb(true);
        Provider.of<SmoothScrollProvider>(context,listen: false).updateOffset(widget.parent, _scrollController.offset);
      }
    });
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return GestureDetector(
      onPanDown: (pan) {
        Provider.of<AbsorbInput>(context, listen: false).setAbsorb(false);
      },
      onPanStart: (pan) {
        Provider.of<AbsorbInput>(context, listen: false).setAbsorb(false);
      },
      child: AbsorbPointer(
        absorbing: Provider.of<AbsorbInput>(context).isAbsorbing(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: RawScrollbar(
            thumbColor: Colors.black,
            thickness: 0,
            controller: _scrollController,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: widget.children.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (c, i) {
                  return widget.children[i];
                }),
          ),
        ),
      ),
    );
  }
}