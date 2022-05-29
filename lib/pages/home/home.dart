import 'package:flutter/material.dart';
import 'package:untitled/widgets/navBar/navBar.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: const [
        NavBar(),
      ],
    );
  }
  
}