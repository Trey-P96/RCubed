

import 'package:flutter/cupertino.dart';

class CustomSliverBuilder{
  final Widget child;
  const CustomSliverBuilder({required this.child});

  // Widget buildSliver(){
  //   return SliverList(delegate: SliverChildListDelegate.fixed([
  //     const SizedBox(),
  //     RepaintBoundary(child: child),
  //   ], addRepaintBoundaries: false, addAutomaticKeepAlives: false,
  //   ));
  // }


  Widget buildSliver(){
    return SliverToBoxAdapter(child: RepaintBoundary(child: child),);
  }
}