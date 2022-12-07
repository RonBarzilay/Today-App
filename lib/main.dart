import 'package:flutter/material.dart';
import 'package:today_app/screens/add_task_screen.dart';
import 'package:today_app/screens/auth_screen.dart';
import 'package:today_app/screens/tasks_screen.dart';

void main() {
  runApp(const today());
}

class today extends StatelessWidget {
  const today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/Tasks': (context) => const TasksScreen(),
        '/New_Task': (context) => const AddTaskScreen()
      },
    );
  }
}
