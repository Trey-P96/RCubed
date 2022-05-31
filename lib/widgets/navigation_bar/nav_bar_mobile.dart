import 'package:flutter/material.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarMobile extends StatelessWidget{
  const NavBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'images/rcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
      logoPath,
      color: MyTheme().secondary,
      width: 60,
      //height: 52,
    );

    // TODO: implement build
    return Container(
      height: 80,
      color: MyTheme().primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(left: 25), child: logo),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
                iconSize: 35,
                color: MyTheme().secondary,
                onPressed: (){},
                icon: Icon(Icons.menu)
            ),
          ),
          // SizedBox(width: 125, child: _NavBarObject('About Us')),
          // SizedBox(width: 125, child: _NavBarObject('Contact')),
          // SizedBox(width: 125, child: _NavBarObject('Careers'))
        ],
      ),
    );
  }
}

class _NavBarObject extends StatelessWidget{
  final String title;
  const _NavBarObject(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: MyTheme().secondary,
      ),
    );
  }

}