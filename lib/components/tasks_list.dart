import 'package:flutter/material.dart';
import 'package:today_app/components/task_tile.dart';

class TasksList extends StatefulWidget {
  late List<TaskTile> tasks;
  final Function updateMyTilesCallback;
  TasksList(
      {Key? key, required this.tasks, required this.updateMyTilesCallback})
      : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: widget.tasks,
      onReorder: (oldIndex, newIndex) {
        widget.updateMyTilesCallback(oldIndex, newIndex);
      },
    );
  }
}
