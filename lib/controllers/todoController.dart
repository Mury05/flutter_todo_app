import 'package:flutter_todo_app/models/todo.dart';

class TodoController {
  List<Todo> _todosList = [
    Todo(todo: "Dinner with Jenny"),
    Todo(todo: "Work on mobile apps for 2 hour"),
    Todo(todo: "Team Meeting"),
    Todo(todo: "Check Emails"),
  ];

  List<Todo> getTodosList() => _todosList;

  void setTodosList({required List<Todo> todoslist}) => _todosList = todoslist;

  void add({required String todo}) {
    if (todo.isNotEmpty && todo.trim() != '') {
      List<Todo> newList = getTodosList();
      newList.insert(0, Todo(todo: todo));
      setTodosList(todoslist: newList);
    }
  }

  // Remove todo
  void remove({required int id}) {
    List<Todo> newList = getTodosList();
    for (Todo todo in newList) {
      if (todo.id == id) {
        newList.removeWhere((todo) => todo.id == id);
      }
    }
  }
}
