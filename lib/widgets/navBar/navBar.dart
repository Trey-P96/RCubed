import 'package:flutter/material.dart';
import 'package:untitled/themes/default.dart';

class NavBar extends StatelessWidget{
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      color: DefaultTheme().primary,
    );
  }

}