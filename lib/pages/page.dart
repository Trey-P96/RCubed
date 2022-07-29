import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
  PageController controller = PageController();
  void animateTo(){
    if(controller.hasClients){
      // pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
      controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
        itemCount: widget.children.length,
        controller: controller,
        itemBuilder: (context, index){
          return widget.children[index];
        });
  }
}