
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/routes/route_generator.dart';
import 'package:rcubed/themes/custom_scrollbar/custom_scrollbar.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:renderer_switcher/renderer_switcher.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

void main() {
  // flutter build web --web-renderer canvaskit --release // faster performance
  //flutter build web --release --web-renderer canvaskit --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false // compatible for android
  // Channel master, 3.1.0-0.0.pre.1129 // Dart version 2.18.0
  //flutter run -d chrome --web-renderer html

  //TODO
  // update favicon
  // add 404.html
  // update emailjs rcubed email
  // update renderer script



  /*




  <script>
    if(screen.availWidth < 600 || screen.availHeight < 600) window.flutterWebRenderer = "html";
    else{window.flutterWebRenderer = "canvaskit";}
  </script>

   */

  //GestureBinding.instance.resamplingEnabled = true;

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


