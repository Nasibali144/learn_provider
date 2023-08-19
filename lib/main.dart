import 'package:flutter/material.dart';
import 'package:learn_provider/controllers/theme_controller.dart';
import 'package:learn_provider/controllers/todo_controller.dart';
import 'package:learn_provider/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'controllers/counter_controller.dart';

void main() {
  runApp(const LearnProvider());
}

class LearnProvider extends StatelessWidget {
  const LearnProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterController>(create: (context) => CounterController()),
        ChangeNotifierProvider<ThemeController>(create: (context) => ThemeController()),
        ChangeNotifierProvider<TodoController>(create: (context) => TodoController()),
      ],
      builder: (ctx, _) {
        return MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: Provider.of<ThemeController>(ctx).mode,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}

/// 1. ChangeNotifier - base controller class
/// 2. notifyListeners() - updater
/// 3. ChangeNotifierProvider - Inherited Widget - Asosiy taminotchi
/// 4. Provider.of<CounterController>(context) - kerakli malomtni inherited widget(ChangeNotifierProvider)dan olish