import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_todo_app/controllers/usercontroller.dart';
import 'package:flutter_todo_app/models/user.dart';
import 'package:flutter_todo_app/screen/auth/register.dart';
import 'package:flutter_todo_app/screen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final UserController _usercontroller = UserController();
  late TextEditingController _username;
  late TextEditingController _password;
  String errorMessage = '';
  bool isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _login() {
    setState(() {
      isFlipped = !isFlipped;
    });

     _controller.forward().then((_) {
    // String? error = _usercontroller.login(_username.text, _password.text);
    // if (error != null) {
    //   setState(() {
    //     errorMessage = error;
    //   });
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         "Connexion ✅",
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: 16,
    //         ),
    //       ),
    //       backgroundColor: Colors.green,
    //       behavior: SnackBarBehavior.floating,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(12),
    //       ),
    //       duration: Duration(seconds: 6),
    //     ),
    //   );
    Navigator.pushNamed(context, '/home');
    // }
     _controller.reverse();
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                    child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Aligne le texte à gauche
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 40, // Augmente la taille de la police
                        fontWeight: FontWeight.bold, // Met le texte en gras
                        color: Colors.deepPurple, // Change la couleur du texte
                      ),
                    ),
                    SizedBox(height: 1), // Espacement entre les textes
                    Text(
                      "Use your email or username to login",
                      style: TextStyle(
                        fontSize: 15, // Taille de la police réduite
                        color: Colors.grey[600], // Couleur grise pour le texte
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: _username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email or username',
                    // hintText: 'Enter valid email id as abc@gmail.com'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 30, bottom: 10),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
             
              SizedBox(
                height: 50,
              ),
              SizedBox(height: 65, width: 360, child: _buildAnimatedButton()),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text('Don\'t have an account? '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 14, color: Colors.deepPurple),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final angle = _animation.value * pi;
        final isBackVisible = angle >= pi / 2;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(angle),
          child: isBackVisible ? _buildBackButton() : _buildFrontButton(),
        );
      },
    );
  }

  Widget _buildFrontButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      ),
      onPressed: _login,
      child: Text(
        'Log in',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
      ),
      onPressed: () {},
      child: Text(
        'Loading...',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
