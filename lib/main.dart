import 'package:flutter/material.dart';
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
    return ChangeNotifierProvider(
      builder: (context, child) {
        return  MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      lazy: true,
      create: (context) => CounterController(),
      child: const HomePage(),
    );
  }
}

/// 1. ChangeNotifier - base controller class
/// 2. notifyListeners() - updater
/// 3. ChangeNotifierProvider - Inherited Widget - Asosiy taminotchi
/// 4. Provider.of<CounterController>(context) - kerakli malomtni inherited widget(ChangeNotifierProvider)dan olish