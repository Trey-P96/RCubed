

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Scratch{

  static List<Widget> scratchList = [
    Padding(
      padding: EdgeInsets.only(top: 20),
      child: Expanded(child: Container(color: Colors.blue, child: Text("CHILD"),)),
    ),
    Container(height: 400, color: Colors.red,),
    Container(height: 400, color: Colors.orange,),
  ];

}