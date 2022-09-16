
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/fonts.dart';

class EmployeeProfile extends StatelessWidget{
  final String name, position;
  const EmployeeProfile({required this.name, required this.position, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        children: [
          Center(
            child: Container(
              child: const Center(child: Text("Employee")),
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(25)),
            ),
          ),
          RcubedText(name, fontFamily: DefaultFonts.kumbhsans, fontSize: 30,),
          Container(height: 1, width: 300, color: Colors.white,),
          RcubedText(position, fontSize: 25,),
        ],
      ),
    );
  }

}