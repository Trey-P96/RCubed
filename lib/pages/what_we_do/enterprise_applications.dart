
import 'package:flutter/cupertino.dart';

class EnterpriseApp extends StatelessWidget{
  const EnterpriseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/what_we_do/conferenceRoom.png'),
          fit: BoxFit.cover,
        )
      ),
    );
  }

}