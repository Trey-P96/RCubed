
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/fonts.dart';

import '../../../../emloyee_info/employee_info.dart';
import '../../../../network_images/network_images.dart';

class EmployeeProfile extends StatelessWidget{
  final String name, position, imgUrl;
  const EmployeeProfile({required this.name, required this.position, required this.imgUrl,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: FittedBox(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
                height: 400,
                width: 400,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(25)),
                child: ClipRRect(borderRadius: BorderRadius.circular(25),child: CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.cover,),),
              ),
            ),
          ),
          FittedBox(child: RcubedText(name, fontFamily: DefaultFonts.kumbhsans, fontSize: 30,)),
          Container(height: 1, width: 300, color: Colors.white, padding: const EdgeInsets.only(left: 10, right: 10),),
          FittedBox(child: RcubedText(position, fontSize: 25,)),
        ],
      ),
    );
  }

}