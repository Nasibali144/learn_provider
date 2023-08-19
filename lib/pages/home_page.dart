import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/counter_controller.dart';
import 'package:learn_provider/controllers/theme_controller.dart';
import 'package:learn_provider/controllers/todo_controller.dart';
import 'package:learn_provider/pages/todo_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<CounterController>(context, listen: false);
    final counter = context.read<CounterController>();
    // final theme = Provider.of<ThemeController>(context, listen: false);
    final theme = context.read<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Provider Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              theme.changeTheme();
            },
            icon: Consumer<ThemeController>(builder: (context, mode, _) {
              return Icon(
                mode.mode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              );
            }),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => counter.increment(),
                  child: const Text(
                    "+1",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Consumer<CounterController>(
                  builder: (context, controller, child) => Text(
                    "${counter.currentCount}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => counter.decrement(),
                  child: const Text(
                    "-1",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TodoPage()),
                );
              },
              child: const Text("Todo App"),
            ),
          ],
        ),
      ),
    );
  }
}
