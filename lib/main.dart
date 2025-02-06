import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screen/auth/login.dart';
import 'package:flutter_todo_app/screen/auth/register.dart';
import 'package:flutter_todo_app/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      initialRoute: '/',
      routes: {
        '/register' : (context) => const RegisterPage(),
        '/home': (context) => const MyHomePage()
      },
    );
  }
}
