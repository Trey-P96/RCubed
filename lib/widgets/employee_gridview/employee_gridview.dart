import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/profile_dialog_box/profile_dialog_box.dart';

import '../../emloyee_info/employee_info.dart';

class EmployeeGridView extends StatelessWidget{
  const EmployeeGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width <= 500? 1: 2,
        ),
        itemCount: Employment.employees.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:(){
                showDialog(
                    context: context,
                    builder: (context){
                      return ProfileDialog(employee: Employment.employees[index],);
                    }
                );
              },
              child: MouseRegion(
                onEnter: (pointer){

                },
                onExit: (pointer){

                },
                child: Card(
                    elevation: 5,
                    child: Stack(
                      children: [
                        Positioned.fill(child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: Employment.employees[index].profilePicture,)),
                        Text(Employment.employees[index].firstName),
                      ],
                    ),
                ),
              ),
            ),
          );
        }
    );
  }

}