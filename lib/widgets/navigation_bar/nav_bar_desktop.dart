import 'package:flutter/material.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarDesktop extends StatelessWidget{
  const NavBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/RcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
        logoPath,
        color: MyTheme().secondary,
        width: 60,
    );

    // TODO: implement build
    return Container(
      height: 60,
      color: MyTheme().primary,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 25, right: 50), child: logo),
          _NavBarObject('About Us'),
          _NavBarObject('Careers'),
          _NavBarObject('Contact'),

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
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22,
            fontFamily: "Roboto",
            fontWeight: FontWeight.normal,
            color: MyTheme().secondary,
        ),
      ),
    );
  }

}