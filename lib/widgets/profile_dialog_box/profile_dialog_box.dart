
import 'package:flutter/material.dart';

class ProfileDialog extends StatelessWidget{
  const ProfileDialog({Key? key}) : super(key: key);

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