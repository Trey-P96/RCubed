import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import '../../providers/smooth_scroll_provider.dart';
import '../../themes/theme.dart';
import 'SmoothScroll.dart';

class SmoothScrollTouch extends StatefulWidget{
  final List<Widget> children;
  final SmoothScroll parent;
  const SmoothScrollTouch({required this.children, required this.parent, Key? key}) : super(key: key);
  SmoothScrollTouchState? of(BuildContext context)=>context.findAncestorStateOfType<SmoothScrollTouchState>();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollTouchState();
  }

}

class SmoothScrollTouchState extends State<SmoothScrollTouch>{
  PageController controller = PageController();
  PageController dummyController = PageController();

  @override
  void initState(){
    super.initState();
    //SmoothScrollProvider scrollProvider = Provider.of<SmoothScrollProvider>(context, listen: false);
    controller.addListener(() {
      if(controller.offset > controller.position.maxScrollExtent) controller.jumpTo(controller.position.maxScrollExtent);
      if(controller.offset < controller.position.minScrollExtent) controller.jumpTo(controller.position.minScrollExtent);
      //if(controller.hasClients) scrollProvider.updateOffset(widget.key, controller.offset);
    });
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          //controller: widget.parent.isPageView? controller:ScrollController(),
          physics: ClampingScrollPhysics(),
          slivers: [
            widget.parent.isPageView?
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                    pageSnapping: false,
                    controller: controller,
                    physics: ClampingScrollPhysics(),
                    itemCount: widget.children.length,
                    itemBuilder: (context, i){
                      return widget.children[i];
                    }
                ),
              ),
            )
                :
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    itemCount: widget.children.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, i){
                      return widget.children[i];
                    }
                ),
              ),
            ),



            // widget.parent.isPageView?
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height,
            //     child: PageView.builder(
            //         scrollDirection: Axis.vertical,
            //         pageSnapping: false,
            //         controller: dummyController,
            //         physics: ClampingScrollPhysics(),
            //         itemCount: widget.children.length,
            //         itemBuilder: (context, i){
            //           return Opacity(opacity: 0,
            //           child: widget.children[i]);
            //         }
            //     ),
            //   ),
            // ) :
            // SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //           (BuildContext context, int index){
            //         return Opacity(opacity: 0,
            //         child: widget.children[index]);
            //       },
            //       childCount: widget.children.length,
            //     )),

          ],
        ),
      ),
    );
  }


//---------------------------------------------------------------------------
//                            UTILITY FUNCTIONS
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
}