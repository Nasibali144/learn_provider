import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Todo"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<TodoController>().createTodo(titleController.text, descController.text);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: "Description"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}