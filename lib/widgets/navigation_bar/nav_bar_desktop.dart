import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/themes/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarDesktop extends StatelessWidget{
  const NavBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/RcubedLogo.svg';
    final Widget logo = SvgPicture.asset(
        logoPath,
        color: MyTheme.secondary,
        width: 60,
    );

    return Container(
      decoration: BoxDecoration(
        color: MyTheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0,4),
            blurRadius: 4
          )
        ]
      ),
      height: 60,
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 25, right: 50),
              child: IconButton(
                icon: logo,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Provider.of<PageIndex>(context, listen: false).pageController.animateToPage(0, duration: Duration(milliseconds: 800), curve: Curves.easeOutQuart);
                },
              )),
          _NavBarObject('About Us', page: 1,),
          _NavBarObject('Careers',page: 2,),
          _NavBarObject('Contact', page: 3,),
          _NavBarObject('Why Us', page: 4,),

        ],
      ),
    );
  }
}

class _NavBarObject extends StatelessWidget{
  final String title;
  final int page;
  _NavBarObject(this.title,{this.page = 0});
  Color color = MyTheme.secondary;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: InkWell(
        onHover: (hover){

        },
        onTap: (){
          Provider.of<PageIndex>(context, listen: false).pageController.animateToPage(page, duration: const Duration(milliseconds: 800), curve: Curves.easeOutQuart);
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 22,
              fontFamily: "Roboto",
              fontWeight: FontWeight.normal,
              color: color,
          ),
        ),
      ),
    );
  }

}