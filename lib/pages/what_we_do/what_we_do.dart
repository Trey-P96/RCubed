

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rcubed/content/home_content.dart';
import 'package:rcubed/widgets/blurredBox.dart';

class WhatWeDo extends StatelessWidget{
  const WhatWeDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      child: BlurredBox(
        padding: EdgeInsets.all(40),
        child: SvgPicture.asset(
            'assets/images/what_we_do/what_we_do.svg',
          fit: BoxFit.fitHeight,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/what_we_do/buildings.png'),
            fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SystemSelect extends StatelessWidget{
  const SystemSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      child: Text(
          "System Select",
        style: TextStyle(
          fontFamily: "Kumbh Sans"
        ),
      ),
    );
  }
}