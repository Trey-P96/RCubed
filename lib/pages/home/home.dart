import 'package:flutter/material.dart';
import 'package:RCubed/widgets/navigation_bar/nav_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
      ],
    );
  }
  
}