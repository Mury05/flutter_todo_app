import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/user.dart';
import 'package:flutter_todo_app/screen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _username;
  late TextEditingController _password;
  String errorMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  void _login() {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      setState(() {
        errorMessage = "All field is required";
      });
    } else {
      final user = users.firstWhere(
          (user) =>
              user.username == _username.text &&
              user.password == _password.text,
          orElse: () => User(username: '', password: ''));
      if (user.username.isEmpty) {
        setState(() {
          errorMessage = "Invalid username or password";
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(65, 219, 219, 219),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              child: SizedBox(
                child: Icon(Icons.login, size: 30),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(fontSize: 25),
                )),
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
                height: 65,
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple)),
                    child: Text(
                      'Log in ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 62),
                      child: Text('Forgot your login details? '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                          onTap: () {
                            print('hello');
                          },
                          child: Text(
                            'Get help logging in.',
                            style: TextStyle(
                                fontSize: 14, color: Colors.deepPurple),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
