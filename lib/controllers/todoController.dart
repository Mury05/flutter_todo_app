import 'package:flutter_todo_app/models/todo.dart';

class TodoController {
  List<Todo> _todosList = [
    Todo(todo: "Dinner with Jenny"),
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
    for (Todo todo in _todosList) {
      if (todo.id == id) {
        _todosList.removeWhere((todo) => todo.id == id);
        break;
      }
    }
  }

  void toggleCheck(int id) {
    for (var todo in _todosList) {
      if (todo.id == id) {
        todo.checkTodo = !todo.checkTodo;
        break;
      }
    }
  }
}
