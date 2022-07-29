

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/widgets/smooth_scrolling/smooth_scroll_mouse.dart';
import 'package:rcubed/widgets/smooth_scrolling/smooth_scroll_touch.dart';

class SmoothScroll extends StatefulWidget{
  final bool isPageView;
  final List<Widget> children;
  final double maxWidth;
  const SmoothScroll({this.maxWidth=double.infinity, required this.isPageView, required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmoothScrollState();
  }
}


class SmoothScrollState extends State<SmoothScroll>{
  PageController pageController = PageController();

  @override
  void dispose(){
    super.dispose();
  }

  void animateTo(int page){
    if(pageController.hasClients){
      pageController.animateToPage(page, duration: Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.maxWidth,
        ),
        child: (Provider.of<DeviceProvider>(context).isTouch())?

        SmoothScrollTouch(isPageView: widget.isPageView, pageController: pageController, children: widget.children,)
            :
        SmoothScrollMouse(pageController: pageController, isPageView: widget.isPageView,
        children: widget.children),
      ),
    );
  }

}