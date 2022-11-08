
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/custom_scroll_physics/custom_scroll_physics.dart';
import 'package:rcubed/themes/fonts.dart';

import '../../../../../themes/rcubed_theme.dart';

class EmployeeProfile extends StatelessWidget{
  final String name, position, bio, imgUrl;
  final bool disableRegion;
  final Color textColor;
  const EmployeeProfile({this.disableRegion=false, this.bio="", this.textColor=Colors.white, required this.name, required this.position, required this.imgUrl, Key? key}) : super(key: key);

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
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: (){
                          if(!disableRegion) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return _EmployeeBio(
                                    name: name,
                                    position: position,
                                    bio: bio,
                                    imageUrl: imgUrl,
                                  );
                                });
                          }
                        },
                        child: ClipRRect(borderRadius: BorderRadius.circular(25),child: CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.cover,),))),
              ),
            ),
          ),
          FittedBox(child: RcubedText(name, fontFamily: DefaultFonts.kumbhsans, fontSize: 30, color: textColor,)),
          Container(height: 1, width: 300, color: textColor, padding: const EdgeInsets.only(left: 10, right: 10),),
          FittedBox(child: RcubedText(position, fontSize: 25, color: textColor,)),
        ],
      ),
    );
  }
}


class _EmployeeBio extends StatelessWidget{
  final String name, position, bio, imageUrl;
  const _EmployeeBio({required this.bio,required this.name, required this.position, required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Container(
        //padding: const EdgeInsets.symmetric(vertical: 40),
        constraints: const BoxConstraints(maxWidth: 900),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const CustomScrollPhysics(),
              child: Column(
                children: [
                  Center(child: EmployeeProfile(name: name, position: position, imgUrl: imageUrl, textColor: Colors.black, disableRegion: true,)),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          decoration: BoxDecoration(border: Border.all(color: bio!=""? Colors.black:Colors.transparent, width: 1), borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(20), child: Text(bio, style: const TextStyle(fontFamily: DefaultFonts.kumbhsans),)),
                    ),),

                  Padding(
                    padding: const EdgeInsets.only(top: 35, bottom: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"),
                    ),
                  ),

                ],
              ),
            ),
            
            Align(alignment: Alignment.topRight, child: IconButton(iconSize: 30, onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.clear)))
          ],
        ),
      ),
    );
  }

}