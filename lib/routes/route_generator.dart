import 'package:flutter/material.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/acquisition_integration/acquisition_integration.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/scratch.dart';

import '../pages/careers/careers.dart';
import '../pages/contact/contact.dart';

class RouteGenerator{


  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (_)=>const Home());
      case '/careers': return MaterialPageRoute(
          settings: settings,
          builder: (_)=>const Careers());

      case '/contact': return MaterialPageRoute(
          settings: settings,
          builder: (_)=>const Contact());

      case '/stories': return MaterialPageRoute(
          settings: settings,
          builder: (_)=>const AcquisitionIntegration());

      default: return MaterialPageRoute(
          settings: settings,
          builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error"),
          ),
          body: const Center(child: Text("ERROR"),),
        );
      });
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
        builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(child: Text("ERROR"),),
      );
    });
  }
}

