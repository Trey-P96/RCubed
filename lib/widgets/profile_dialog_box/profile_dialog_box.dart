
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

import '../../emloyee_info/employee_info.dart';

class ProfileDialog extends StatelessWidget{
  final Employee employee;
  const ProfileDialog({required this.employee, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Palette.offWhite], begin: Alignment.topCenter, end: Alignment.bottomCenter),),
            ),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CachedNetworkImage(imageUrl: employee.profilePicture),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${employee.firstName} ${employee.lastName}"),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(employee.description),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Icons.close),),
            ),
          ],
        ),
      ),
    );
  }

}