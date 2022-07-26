
import 'package:flutter/cupertino.dart';
import 'package:rcubed/widgets/nav_bar/nav_bar_desktop.dart';
import 'package:rcubed/widgets/nav_bar/nav_bar_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget{
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenTypeLayout(
        mobile: NavBarMobile(),
        desktop: NavBarDesktop(),
    );
  }
  
}