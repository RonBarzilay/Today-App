import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function doubleTapCallback;
  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.doubleTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        doubleTapCallback();
      },
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            shape: const CircleBorder(),
            onChanged: (value) {
              checkboxCallback(value);
            },
          ),
        ),
      ),
    );
  }
}
