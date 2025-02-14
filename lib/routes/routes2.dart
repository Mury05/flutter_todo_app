import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/auth/login.dart';
import 'package:flutter_todo_app/screen/auth/register.dart';
import 'package:flutter_todo_app/screen/home.dart';
import 'package:page_transition/page_transition.dart';

class Routing {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 800),
            child: const LoginPage());
      case '/login':
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 900),
            child: const LoginPage());
      case '/register':
        return PageTransition(
            type: PageTransitionType.topToBottom,
            duration: Duration(milliseconds: 800),
            child: const RegisterPage());
      case '/home':
        return PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 800),
            child: const MyHomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("La route n'existe pas !!"),
                  ),
                ));
    }
  }
}
