import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [ListTile(title: Text("Accueil"))],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(65, 219, 219, 219),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SizedBox(
                child: Icon(Icons.person, size: 30),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 232, 230, 235)),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Input Search
              CustomTextInput(hintText: "Search", prefixIcon: Icons.search, borderRadius: 30, padding: 16,),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "All ToDos",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Todo(todoText: "Dinner with Jenny", checkTodo: false),
                    SizedBox(
                      height: 20,
                    ),
                    Todo(
                        todoText: "Work on mobile apps for 2 hour",
                        checkTodo: true),
                    SizedBox(
                      height: 20,
                    ),
                    Todo(todoText: "Team Meeting", checkTodo: false),
                    SizedBox(
                      height: 20,
                    ),
                    Todo(todoText: "Check Emails", checkTodo: false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(65, 219, 219, 219),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CustomTextInput(hintText: "Add a new todo item", borderRadius: 10,padding: 10,),
              ),

              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: _incrementCounter,
                tooltip: 'Add Todo',
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Todo extends StatelessWidget {
  final String todoText;
  final bool checkTodo;
  const Todo({
    super.key,
    required this.todoText,
    required this.checkTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                activeColor: Colors.deepPurple,
                checkColor: Colors.white,
                side: BorderSide(color: Colors.deepPurple, width: 2),
                value: false,
                onChanged: (bool? newValue) {
                  newValue = checkTodo;
                },
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                ),
                child: Text(
                  todoText,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final double borderRadius;
  final double padding;

  const CustomTextInput({
    super.key,
    required this.hintText,
    this.prefixIcon, required this.borderRadius, required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          hintText: hintText,
        ),
      ),
    );
  }
}
