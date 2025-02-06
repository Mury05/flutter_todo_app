class Todo {
  int id;
  final String todo;
  bool checkTodo;

  Todo({required this.todo}) : id = DateTime.now().microsecondsSinceEpoch, checkTodo = false;

}
