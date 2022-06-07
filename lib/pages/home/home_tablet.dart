
import 'package:flutter/material.dart';
import 'package:rcubed/widgets/rcubed_logo/rcubed_logo.dart';
import '../../widgets/navigation_bar/nav_bar.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        NavBar(),
        Expanded(
          child: ListView.builder(
              controller: ScrollController(),
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (context, i) {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: Logo(200),
                );
              }),
        ),
      ],
    );
  }
}
