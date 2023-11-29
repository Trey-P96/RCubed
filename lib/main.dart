
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rcubed/routes/route_generator.dart';
import 'package:rcubed/themes/custom_scrollbar/custom_scrollbar.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';



void main() {

  // CURRENT BUILD VERSIONS:
  // Flutter (Channel stable, 3.3.4, on Microsoft Windows [Version 10.0.19045.2251], locale en-US)
  // Dart version 2.18.2

  //build command:
  //flutter build web --release --web-renderer auto --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false


  //Step 1: AFTER BUILDING FOR WEB, ADD SCRIPT (LOCATED BELOW THIS LINE) TO: build/web/index.html inside <body>. Be sure to paste inside <body> before any other scripts.

  /*
  <script>
    if(screen.availWidth < 600 || screen.availHeight < 600) window.flutterWebRenderer = "html";
    else{window.flutterWebRenderer = "canvaskit";}
  </script>
   */

  //Step 2 (for staging): update href inside build/web/index.html on line 17 to "/staged/" (assuming "staged" folder exists under /root) .. for production: set <base href="/">
  //Step 3: copy code from index.html and paste into 404.html. If 404.html does not exist inside build folder, then create it manually in same folder as index.html... ps. if in staged, manually typing url in url bar (eg. rcubedco/staged/contact) will result in 404 page not found.
  //Step 4: under project folder navigate to folder "icons" and copy all files EXCEPT for favicon.png, then paste and overwrite into build/web/icons. Then copy and overwrite favicon.png to build/web
  //Step 5: inside build/web/ replace favicon.png with favicon.png located in RCubed/icons.


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


