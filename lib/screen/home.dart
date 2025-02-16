import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo_app/controllers/todocontroller.dart';
import 'package:flutter_todo_app/models/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TodoController _todoController = TodoController();
  List<Todo> todosList = [];
  late String newTodo;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    todosList = _todoController.getTodosList();
    _controller = TextEditingController();
  }

  void _addTodo(String todo) {
    newTodo = todo;
    setState(() {
      _todoController.add(todo: newTodo);
      _controller.clear();
    });
  }

  void _deleteTodo(int id) {
    setState(() {
      _todoController.remove(id: id);
    });
  }

  void _toggleTodoCheck(int id) {
    setState(() {
      _todoController.toggleCheck(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(
              height: 60,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ), //BoxDecoration
                child: Text(''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Todo App ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Welcome to navigation bar',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              hoverColor:
                  const Color.fromARGB(255, 176, 145, 230), 
              leading: const Icon(
                Icons.home,
                color: Colors.deepPurple, 
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.deepPurple[800], 

                ),
              ),
              
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              hoverColor:
                  const Color.fromARGB(255, 176, 145, 230), 
              leading: const Icon(
                Icons.logout,
                color: Colors.deepPurple, 
              ),
              title: Text(
                'LogOut',
                style: TextStyle(
                  color: Colors.deepPurple[800], 

                ),
              ),
              
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
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
              CustomTextInput(
                hintText: "Search",
                prefixIcon: Icons.search,
                borderRadius: 30,
                padding: 16,
              ),

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
                    DisplayTodo(
                      todosList: todosList,
                      deleteTodo: _deleteTodo,
                      toggleCheck: _toggleTodoCheck,
                    ),
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
                child: CustomTextInput(
                  hintText: "Add a new todo item",
                  borderRadius: 10,
                  padding: 10,
                  submitInput: _addTodo,
                  controller: _controller,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.deepPurple,
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _addTodo(_controller.text);
                  }
                },
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

class DisplayTodo extends StatelessWidget {
  final Function(int) deleteTodo;
  final Function(int) toggleCheck;
  const DisplayTodo({
    super.key,
    required this.todosList,
    required this.deleteTodo,
    required this.toggleCheck,
  });

  final List<Todo> todosList;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: todosList.length,
        itemBuilder: (context, index) {
          return TodoItem(
            id: todosList[index].id,
            todoText: todosList[index].todo,
            checkTodo: todosList[index].checkTodo,
            deleteTodo: deleteTodo,
            toggleCheck: toggleCheck,
          );
        },
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String todoText;
  final bool checkTodo;
  final Function(int) deleteTodo;
  final Function(int) toggleCheck;
  final int id;
  const TodoItem({
    super.key,
    required this.todoText,
    required this.checkTodo,
    required this.deleteTodo,
    required this.id,
    required this.toggleCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                    value: checkTodo,
                    onChanged: (bool? newValue) {
                      toggleCheck(id);
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
                          decoration: checkTodo
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => deleteTodo(id),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final double borderRadius;
  final double padding;
  final Function? submitInput;
  final TextEditingController? controller;

  const CustomTextInput({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.borderRadius,
    required this.padding,
    this.submitInput,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextField(
        controller: controller,
        onSubmitted: submitInput as ValueChanged<String>?,
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
