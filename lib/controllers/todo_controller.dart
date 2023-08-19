import 'package:flutter/foundation.dart';
import 'package:learn_provider/models/todo_model.dart';

class TodoController with ChangeNotifier {
  final List<Todo> _items = [];
  List<Todo> get todos => _items;


  void createTodo(String title, String description) {
    if (title.isEmpty || description.isEmpty) return;

    final todo = Todo(id: todos.length + 1,title: title, description: description, isCompleted: false);
    _items.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _items.remove(todo);
    notifyListeners();
  }

  void completeTodo(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }
}