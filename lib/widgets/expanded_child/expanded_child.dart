
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/animated_container_provider.dart';
import 'package:rcubed/widgets/page_category/page_category.dart';

class ExpandedChild extends StatefulWidget{
  final String title;
  final GlobalKey<ExpandedChildState> key;
  const ExpandedChild({required this.title, required this.key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpandedChildState();
  }
}

class ExpandedChildState extends State<ExpandedChild>{
  double? height;

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box = widget.key.currentContext!.findRenderObject() as RenderBox;
      height = box.size.height;
      //Provider.of<AnimatedContainerProvider>(context, listen: false).setHeight(height);
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const TestWidget();
  }

}