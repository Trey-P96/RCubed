import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import '../../themes/theme.dart';

class SliverScroll extends StatefulWidget{
  final List<Widget> children;
  const SliverScroll({required this.children, Key? key}) : super(key: key);
  SliverScrollState? of(BuildContext context)=>context.findAncestorStateOfType<SliverScrollState>();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliverScrollState();
  }

}

class SliverScrollState extends State<SliverScroll>{
  ScrollController controller = ScrollController();

  @override
  void initState(){
    super.initState();
    controller.addListener(() {
      if(controller.offset > controller.position.maxScrollExtent) controller.jumpTo(controller.position.maxScrollExtent);
      if(controller.offset < controller.position.minScrollExtent) controller.jumpTo(controller.position.minScrollExtent);
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (notification){
        if(notification is OverscrollNotification){
          widget.of(context)?.controller.jumpTo(widget.of(context)!.controller.offset + notification.overscroll);
        }
        return true;
      },
      child: CustomScrollView(
        controller: controller,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index){
                  return widget.children[index];
                },
                childCount: widget.children.length,
              )),
        ],
      ),
    );
  }


//---------------------------------------------------------------------------
//                            UTILITY FUNCTIONS
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
}