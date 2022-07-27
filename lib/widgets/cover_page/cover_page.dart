

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../blurred_box/blurred_box.dart';

class CoverPage extends StatelessWidget{
  final String backgroundPath;
  final String titlePath;
  const CoverPage({required this.titlePath, required this.backgroundPath, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(backgroundPath)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: ClipRRect(
                      child: AspectRatio(
                        aspectRatio: 8,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: Container(
                            //child: FittedBox(fit: BoxFit.fitWidth, child: SvgPicture.asset("assets/images/what_we_do/what_we_do.svg")),
                            color: Colors.black.withOpacity(0.5),),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 500),
                    child: ClipRRect(
                      child: AspectRatio(
                        aspectRatio: 8,
                        child: Container(
                          child: FittedBox(fit: BoxFit.fitHeight, child: SvgPicture.asset(titlePath)),
                          color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: SizedBox(width: 200, height: 40,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(primary: RCubedTheme.primary),
                      child: Text("LEARN MORE"))),
            ),
          )
          
          
        ],
      ),
    );
  }

}



// ClipRRect(
// borderRadius: BorderRadius.circular(radius),
// child: BackdropFilter(
// filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
// child: FittedBox(
// child: Container(
// alignment: Alignment.center,
// width: width,
// height: height,
// color: color.withOpacity(opacity),
// child: Align(
// alignment: Alignment.center,
// child: child,
// ),
// ),
// ),
// ),
// ),