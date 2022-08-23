
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class EnterpriseApplications extends StatelessWidget{
  const EnterpriseApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(height: 50, child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: const Text(heading, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ), alignment: Alignment.centerLeft,color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(child: const Text(info, style: TextStyle(fontWeight: FontWeight.bold)),alignment: Alignment.centerLeft,),
        ),
      ],
    );
  }
}

const heading = "Enterprise Applications";

const info = ''' 
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 ''';