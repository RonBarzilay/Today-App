import 'package:flutter/material.dart';
import 'package:today_app/components/task_tile.dart';

class TasksList extends StatefulWidget {
  late List<TaskTile> tasks;
  TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.tasks,
    );
  }
}
