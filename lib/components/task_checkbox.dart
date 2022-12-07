import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function checkboxCallback;
  TaskCheckbox(
      {Key? key, required this.checkboxCallback, required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        onChanged: (bool? value) {
          checkboxCallback(value);
        },
      ),
    );
  }
}
