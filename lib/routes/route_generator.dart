import 'package:flutter/material.dart';
import 'package:rcubed/main.dart';
import 'package:rcubed/pages/home/home.dart';
import 'package:rcubed/scratch.dart';

class RouteGenerator{


  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (_)=>const Home());
      case '/test': return MaterialPageRoute(
          settings: settings,
          builder: (_)=>const TestRoute());
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

