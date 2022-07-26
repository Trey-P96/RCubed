
import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget{
  final String path;
  const Background({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned.fill(child: Image.asset(path, fit: BoxFit.cover,));
  }

}