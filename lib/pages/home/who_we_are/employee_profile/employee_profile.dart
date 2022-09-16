
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
            child: Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: FittedBox(
                child: Container(
                  child: const Center(child: Text("Employee")),
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
          ),
          FittedBox(child: RcubedText(name, fontFamily: DefaultFonts.kumbhsans, fontSize: 30,)),
          Container(height: 1, width: 300, color: Colors.white, padding: const EdgeInsets.only(left: 10, right: 10),),
          FittedBox(child: RcubedText(position, fontSize: 25,)),
        ],
      ),
    );
  }

}