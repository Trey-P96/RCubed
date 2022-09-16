
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/physics.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/animated_container_provider.dart';
import 'package:rcubed/providers/contact_form_provider.dart';
import 'package:rcubed/providers/custom_appbar_provider.dart';
import 'package:rcubed/providers/what_we_do_providers.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/providers/scaffold_provider.dart';
import 'package:rcubed/providers/who_we_are_providers.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/widgets/device_listener/device_listener.dart';
import 'package:rcubed/widgets/nav_bar/nav_bar.dart';
import 'package:rcubed/widgets/nav_bar/nav_list.dart';
import 'package:rcubed/widgets/smooth_scrolling/smooth_scrolling.dart';

void main() {
  // flutter build web --web-renderer canvaskit --release // faster performance
  //flutter build web --release --web-renderer canvaskit --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false // compatible for android
  // Channel master, 3.1.0-0.0.pre.1129 // Dart version 2.18.0
  //flutter run -d chrome --web-renderer html

  //GestureBinding.instance.resamplingEnabled = true;
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>DeviceProvider()),
          ChangeNotifierProvider(create: (_)=>PrimaryScrollProvider()),
          ChangeNotifierProvider(create: (_)=>ScaffoldProvider()),
          ChangeNotifierProvider(create: (_)=>WhatWeDoProvider()),
          ChangeNotifierProvider(create: (_)=>WhoWeAreProvider()),
          ChangeNotifierProvider(create: (_)=>CustomAppBarProvider()),
          ChangeNotifierProvider(create: (_)=>ContactProvider()),
          ChangeNotifierProvider(create: (_)=>AnimatedContainerProvider()),
    ],
    child: const MyApp(),)
  );

}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }


  // This widget is the root of your application.
  // git test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      scrollBehavior: const MaterialScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'R-Cubed Consulting',
      theme: ThemeData(
        scaffoldBackgroundColor: RCubedTheme.secondary,
        fontFamily: 'MyRoboto',
        textTheme: Theme.of(context).textTheme.apply(
          fontSizeDelta: 2,
          fontSizeFactor: 1.1
        )
      ),
      home: SafeArea(
        child: DeviceListener(
          child: Scaffold(
            //key: scaffoldKey,
            endDrawer: Drawer(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: const Center(child: NavList()),
            ),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 5,
              title: const NavBar(),
              actions: [Container()],
              titleSpacing: 0,
            ),
            body: const Home()),
        ),
      ),

    );
  }
}


class CustomScrollPhysics extends ScrollPhysics{
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('$runtimeType.applyBoundaryConditions() was called redundantly.'),
          ErrorDescription(
            'The proposed new position, $value, is exactly equal to the current position of the '
                'given ${position.runtimeType}, ${position.pixels}.\n'
                'The applyBoundaryConditions method should only be called when the value is '
                'going to actually change the pixels, otherwise it is redundant.',
          ),
          DiagnosticsProperty<ScrollPhysics>('The physics object in question was', this, style: DiagnosticsTreeStyle.errorProperty),
          DiagnosticsProperty<ScrollMetrics>('The position object in question was', position, style: DiagnosticsTreeStyle.errorProperty),
        ]);
      }
      return true;
    }());
    if (value < position.pixels && position.pixels <= position.minScrollExtent) // underscroll
      return value - position.pixels;
    if (position.maxScrollExtent <= position.pixels && position.pixels < value) // overscroll
      return value - position.pixels;
    if (value < position.minScrollExtent && position.minScrollExtent < position.pixels) // hit top edge
      return value - position.minScrollExtent;
    if (position.pixels < position.maxScrollExtent && position.maxScrollExtent < value) // hit bottom edge
      return value - position.maxScrollExtent;
    return 0.0;
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    final Tolerance tolerance = this.tolerance;
    if (position.outOfRange) {
      double? end;
      if (position.pixels > position.maxScrollExtent)
        end = position.maxScrollExtent;
      if (position.pixels < position.minScrollExtent)
        end = position.minScrollExtent;
      assert(end != null);
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        end!,
        min(0.0, velocity),
        tolerance: tolerance,
      );
    }
    if (velocity.abs() < tolerance.velocity)
      return null;
    if (velocity > 0.0 && position.pixels >= position.maxScrollExtent)
      return null;
    if (velocity < 0.0 && position.pixels <= position.minScrollExtent)
      return null;
    return ClampingScrollSimulation(
      position: position.pixels,
      velocity: velocity,
      tolerance: tolerance,
      friction: 0.005
    );
  }

}