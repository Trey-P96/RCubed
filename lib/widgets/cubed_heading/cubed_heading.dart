
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CubedHeading extends StatelessWidget{
  final String path;
  const CubedHeading({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: AspectRatio(
          aspectRatio: 14,
          child: SvgPicture.asset(path,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

}