
import 'package:flutter/material.dart';
import 'package:rcubed/themes/fonts.dart';

import '../../../../themes/rcubed_theme.dart';

class IntegrationArchitecture extends StatelessWidget {
  const IntegrationArchitecture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: const [
                Divider(),
                RcubedText(info)],
            ),
          ),
        ],
      ),
    );
  }
}

const heading = "Integration Architecture";

const info = ''' 
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 ''';