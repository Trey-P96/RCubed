
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rcubed/themes/fonts.dart';
import 'package:rcubed/themes/rcubed_theme.dart';

class DescriptonBox extends StatelessWidget{
  final String description;
  const DescriptonBox({required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
          child: RcubedText(description,))
      ),
    );
  }
}

