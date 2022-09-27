
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:rcubed/providers/animated_container_provider.dart';
import 'package:rcubed/providers/contact_form_provider.dart';
import 'package:rcubed/providers/custom_appbar_provider.dart';
import 'package:rcubed/providers/what_we_do_providers.dart';
import 'package:rcubed/providers/device_provider.dart';
import 'package:rcubed/providers/primary_scroll_provider.dart';
import 'package:rcubed/providers/scaffold_provider.dart';
import 'package:rcubed/providers/who_we_are_providers.dart';
import 'package:rcubed/routes/route_generator.dart';
import 'package:rcubed/themes/rcubed_theme.dart';
import 'package:flutter/material.dart';
import 'package:renderer_switcher/renderer_switcher.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // flutter build web --web-renderer canvaskit --release // faster performance
  //flutter build web --release --web-renderer canvaskit --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false // compatible for android
  // Channel master, 3.1.0-0.0.pre.1129 // Dart version 2.18.0
  //flutter run -d chrome --web-renderer html



  /*
  <script>
    if(window.innerWidth < 600 || window.innerHeight < 600) window.flutterWebRenderer = "html";
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
          scaffoldBackgroundColor: RCubedTheme.secondary,
          fontFamily: 'MyRoboto',
          textTheme: Theme.of(context).textTheme.apply(
            fontSizeDelta: 2,
            fontSizeFactor: 1.1
          )
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,

      ),
    );
  }
}


