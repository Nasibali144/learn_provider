import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/todo_controller.dart';
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
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: IconButton(onPressed: () {
                  controller.deleteTodo(todo);
                }, icon: const Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}