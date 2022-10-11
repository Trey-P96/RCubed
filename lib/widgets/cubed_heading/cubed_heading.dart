
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CubedHeading extends StatelessWidget{
  final String path;
  final double topPadding, bottomPadding;
  const CubedHeading({this.topPadding=20, this.bottomPadding=40, required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: AspectRatio(
            aspectRatio: 14,
            child: RepaintBoundary(
              child: SvgPicture.asset(path,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }

}