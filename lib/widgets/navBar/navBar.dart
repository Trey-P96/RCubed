import 'package:flutter/material.dart';
import 'package:RCubed/themes/default.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatelessWidget{
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'images/RcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
        logoPath,
        color: DefaultTheme().secondary,
    );

    // TODO: implement build
    return Container(
      height: 100,
      color: DefaultTheme().primary,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.all(20), child: logo),
          SizedBox(width: 150, child: _NavBarObject('About Us')),
          SizedBox(width: 150, child: _NavBarObject('Contact')),
          SizedBox(width: 150, child: _NavBarObject('Careers'))
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
          color: DefaultTheme().secondary,
      ),
    );
  }

}