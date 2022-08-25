
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class EnterpriseApplications extends StatelessWidget{
  const EnterpriseApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:50),
      child: Column(
        children: [
          Container(height: 50, child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: RCubedTheme.offPrimary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(heading, style: TextStyle(color: Colors.white, fontSize: 20),),
                  )),
            ),
          ),
            alignment: Alignment.centerLeft,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Divider(),
                Container(child: const Text(info, style: TextStyle(fontWeight: FontWeight.bold)),alignment: Alignment.centerLeft,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const heading = "Enterprise Applications";

const info = ''' 
    R-CUBED provides solutions across the end-to-end application journey. We maximize potential by shaping your digital strategy with deliberate
  execution that fuels transformation and maximizes potential.
 ''';