import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../providers/primary_scroll_provider.dart';
import '../logo/logo_simple.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({Key? key}) : super(key: key);
  final double navBarHeight = 60;
  final double iconSize = 40;
  final double outerPadding = 20;


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      height: navBarHeight,
      color: RCubedTheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarObject(
            child: IconButton(
                padding: EdgeInsets.zero,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: Colors.blue,
                onPressed: () {
                    Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState?.animateTo(0);
                },
                iconSize: iconSize,
                icon: Logo()),
          ),
          _NavBarObject(
            child: InkWell(
              onTap: () {
                Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState?.animateTo(1);
              },
              child: const Text("What We Do"),
            ),
          ),
          _NavBarObject(
            child: _NavBarObject(
              child: InkWell(
                onTap: () {
                  Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState?.animateTo(2);
                },
                child: const Text("Who We Are"),
              ),
            ),
          ),
          _NavBarObject(
            child: InkWell(
              onTap: () {
                Provider.of<PrimaryScrollProvider>(context,listen: false).getKey().currentState?.animateTo(3);
              },
              child: const Text("Why Us"),
            ),
          ),
          _NavBarObject(
            child: InkWell(
              onTap:(){
                launchUrlString("https://rcubed.bamboohr.com/jobs/");
              },
              child: const Text("Careers"),
            ),
          ),
          const _NavBarObject(
            child: InkWell(
              child: Text("Contact"),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarObject extends StatelessWidget {
  final Widget child;

  const _NavBarObject({required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: child,
    );
  }
}
