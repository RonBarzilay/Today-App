import 'package:flutter/material.dart';

import 'screens/tasks_screen.dart';

void main() {
  runApp(const today());
}

class today extends StatelessWidget {
  const today({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasksScreen(),
    );
  }
}
