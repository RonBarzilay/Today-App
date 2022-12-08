import 'package:flutter/material.dart';
import 'package:today_app/components/task_checkbox.dart';

class TaskTile extends StatefulWidget {
  late String taskName;
  bool isChecked = false;

  TaskTile({Key? key, required this.taskName}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  void checkboxCallback(bool newValue) {
    setState(() {
      widget.isChecked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskName,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: TaskCheckbox(
          checkboxCallback: checkboxCallback, isChecked: widget.isChecked),
    );
  }
}
