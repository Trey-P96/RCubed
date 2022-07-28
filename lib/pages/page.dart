import 'package:flutter/cupertino.dart';

class NewPage extends StatefulWidget{
  final List<Widget> children;
  const NewPage({required this.children, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState();
  }
}

class PageState extends State<NewPage>{
  PageController pageController = PageController();

  void animateTo(){
    if(pageController.hasClients){
      pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        controller: pageController,
        itemCount: widget.children.length,
        itemBuilder: (context, index){
          return widget.children[index];
        });
  }
}