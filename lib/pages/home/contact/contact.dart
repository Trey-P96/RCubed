
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/custom_appbar/custom_appbar.dart';

import '../../../widgets/embedded_web_page/embedded_web_page.dart';

class Contact extends StatelessWidget{
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        CustomAppbar(
            title: "Careers",

            body: Container(
              color: Colors.white,
              child: const EmbeddedWebPage(url: "https://rcubed.bamboohr.com/jobs/",),
            ),
        ),
      ],
    );
  }

}