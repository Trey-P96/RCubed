

import 'package:flutter/cupertino.dart';
import 'package:rcubed/content/home_content.dart';

class AboutUs extends StatelessWidget{
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text(HomeContent.aboutUs),
    );
  }
}

class SystemSelect extends StatelessWidget{
  const SystemSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: Text("System Select"),
    );
  }
}