import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/todo_controller.dart';
import 'package:learn_provider/models/todo_model.dart';
import 'package:provider/provider.dart';

import 'todo_detail_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: Consumer<TodoController>(
        builder: (context, controller, _) {
          final todos = controller.todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ItemView(todo: todo,);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Detail()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


class ItemView extends StatelessWidget {
  final Todo todo;
  const ItemView({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: IconButton(
        onPressed: () {
          context.read<TodoController>().deleteTodo(todo);
        },
        icon: const Icon(Icons.delete),
      ),
      /*leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          context.read<TodoController>().completeTodo(todo);
        },
      ),*/
      /*leading: Selector<TodoController, bool>(
        selector: (context, controller) {
          return controller.todos.first.isCompleted;
        },
        builder: (context, value, child) {
          return  IconButton(
            onPressed: () {
              context.read<TodoController>().completeTodo(todo);
            },
            icon: Icon(value? Icons.check_box: Icons.check_box_outline_blank),
          );
        },
      ),*/
      leading: IconButton(
        onPressed: () {
          context.read<TodoController>().completeTodo(todo);
        },
        icon: Icon(todo.isCompleted? Icons.check_box: Icons.check_box_outline_blank),
      ),
    );
  }
}
