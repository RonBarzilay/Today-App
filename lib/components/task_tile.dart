import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  late String taskName;
  TaskTile({Key? key, required this.taskName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskName),
      trailing: Checkbox(
        value: false,
        onChanged: (bool? value) {},
      ),
    );
  }
}
