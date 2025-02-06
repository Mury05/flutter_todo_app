import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/auth/login.dart';
import 'package:flutter_todo_app/screen/auth/register.dart';
import 'package:flutter_todo_app/screen/home.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/register': (context) => const RegisterPage(),
    '/home': (context) => const MyHomePage(),
    '/': (context) => const LoginPage()
  };

  Map<String, WidgetBuilder> getRoutes() {
    return _routes;
  }
}
