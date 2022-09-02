
import 'package:flutter/material.dart';

import '../../../../themes/rcubed_theme.dart';

class ManagedServices extends StatelessWidget {
  const ManagedServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(height: 50, child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: RCubedTheme.offPrimary,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
                    child: Text(heading, style: TextStyle(color: Colors.white, fontSize: 20),),
                  )),
            ),
          ),
            alignment: Alignment.centerLeft,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const Divider(),
                Container(child: const Text(info, style: TextStyle(fontWeight: FontWeight.bold)),alignment: Alignment.centerLeft,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const heading = "Managed Services";

const info = ''' 
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 ''';