import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_app/components/task_data.dart';
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
    return ChangeNotifierProvider(
      // ChangeNotifierProvider allow us to provide all
      // children under main in the tree access to TaskData(TasksList)
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => kIsWeb ? TasksScreen() : const AuthScreen(),
          '/Tasks': (context) => TasksScreen(),
          '/New_Task': (context) => AddTaskScreen()
        },
      ),
    );
  }
}
