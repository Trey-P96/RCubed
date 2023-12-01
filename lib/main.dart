
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/routes/route_generator.dart';
import 'package:rcubed/themes/custom_scrollbar/custom_scrollbar.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';



void main() {

//---------- SEE README FOR INSTRUCTIONS TO BUILD----------------0


  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    const MyApp(),
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
    return ProviderScope(
      child: MaterialApp(
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
          ),
        debugShowCheckedModeBanner: false,
        title: 'R-Cubed Consulting',
        theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            thickness: PlatformScrollBar.thickness(),
            radius: PlatformScrollBar.radius(),
            thumbVisibility: PlatformScrollBar.thumbVisibility(),
            trackVisibility: PlatformScrollBar.trackVisibility(),
            thumbColor: PlatformScrollBar.thumbColor(),
            trackColor: PlatformScrollBar.trackColor(),
            trackBorderColor: const MaterialStatePropertyAll(Colors.transparent),

          ),
          scaffoldBackgroundColor: RCubedTheme.secondary,
          fontFamily: 'MyRoboto',

          textTheme: Theme.of(context).textTheme.apply(
            fontSizeDelta: 2,
            fontSizeFactor: 1.1
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,

      ),
    );
  }
}


