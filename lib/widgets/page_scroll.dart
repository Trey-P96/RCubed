
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/widgets/scroll_window/scroll_page.dart';

class PageScroll extends StatefulWidget{
  final List<ScrollPage> children;
  final String pageDescription;
  const PageScroll({required this.pageDescription, required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    
    return PageScrollState();
  }

}

class PageScrollState extends State<PageScroll>{
  final pageController = PageController();
  bool test = true;

  PageScrollState(){
    //_start();
  }

  // void _start() {
  //   Timer.periodic(const Duration(milliseconds: 1), (timer) async {
  //     if(pageController.page! - pageController.page!.toInt() > 0.5){
  //       pageController.animateToPage(pageController.page!.toInt()+1, duration: Duration(milliseconds: 400), curve: Curves.easeOutQuart);
  //       await Future.delayed(Duration(milliseconds: 400));
  //     }
  //     //print(pageController.position.activity!.isScrolling);
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    PageHandler pageHandler = Provider.of<PageHandler>(context, listen: false);
    ScrollPhysics scrollPhysics = AlwaysScrollableScrollPhysics();
    for(int i=0; i<widget.children.length;i++){
      pageHandler.setPage(widget.children[i].description, i);
    }

    pageController.addListener(() {
      int currentPage = pageHandler.currentPage();
      if(pageController.page! - currentPage > 0.5){
        pageHandler.updateSnapping(true);
        pageHandler.updatePhysics(NeverScrollableScrollPhysics());
      }
      if(pageController.page! - currentPage < -0.5){
        pageHandler.updateSnapping(true);
        pageHandler.updatePhysics(NeverScrollableScrollPhysics());
      }
      if((pageController.page! - currentPage).abs() == 1){
        pageHandler.updateSnapping(false);
        pageHandler.updatePage(pageController.page!.round());
        pageHandler.updatePhysics(AlwaysScrollableScrollPhysics());
      }
      //print(pageController.page! - currentPage);
    });


    
    return Expanded(
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: Provider.of<PageHandler>(context).getPhysics(),
          pageSnapping: Provider.of<PageHandler>(context).getSnap(),
          itemCount: widget.children.length,
          itemBuilder: (context, index){
            return widget.children[index];
          }),
    );
  }

}