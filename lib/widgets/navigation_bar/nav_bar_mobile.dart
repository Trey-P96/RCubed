import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

import '../../main.dart';
import '../blurredBox.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool ignore = Provider.of<IgnoreMouse>(context).isActive;
    final scaffoldKey = GlobalKey<ScaffoldState>();
    const String logoPath = 'assets/images/RcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
      logoPath,
      color: MyTheme.secondary,
      width: 40,
      //height: 52,
    );

    
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: MyTheme.primary, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 4),
                blurRadius: 4)
          ]),
          height: 50,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<PageIndex>(context, listen: false).pageController.animateToPage(0, duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
                      },
                      icon: logo,
                      padding: EdgeInsets.zero,
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Builder(
                    builder: (context) {
                      return IconButton(
                          iconSize: 35,
                          color: MyTheme.secondary,
                          onPressed: () {
                            //Provider.of<IgnoreMouse>(context, listen: false).setValue(false);
                            scaffoldKey.currentState!.openEndDrawer();

                            //print(scaffoldKey.currentState!.isEndDrawerOpen);
                          },
                          icon: Icon(Icons.menu));
                    }
                  ),
                ),
                // SizedBox(width: 125, child: _NavBarObject('About Us')),
                // SizedBox(width: 125, child: _NavBarObject('Contact')),
                // SizedBox(width: 125, child: _NavBarObject('Careers'))
              ],
            ),
        ),
        Expanded(
          child: TransparentPointer(
            child: Scaffold(
              key: scaffoldKey,
              drawerScrimColor: Colors.transparent,
              endDrawer: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Drawer(
                    backgroundColor: Colors.white.withOpacity(0.6),
                    child: Container(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class _NavBarObject extends StatelessWidget {
  final String title;

  const _NavBarObject(this.title);

  @override
  Widget build(BuildContext context) {
    
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: MyTheme.secondary,
      ),
    );
  }
}
