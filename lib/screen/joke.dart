import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final String url = "https://official-joke-api.appspot.com/random_joke";

  Future<Map<String, dynamic>> getRandomJoke() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Echec lors de la récupération');
    }
  }

  @override
  Widget build(BuildContext context) {
    getRandomJoke();
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
                      children: [const Text("For Joking !!")],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
