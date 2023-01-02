import 'package:flutter/material.dart';
import 'package:today_app/components/task.dart';
import 'package:today_app/components/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  // Reorder method
  void updateMyTiles(oldIndex, newIndex) {
    setState(() {
      // an adjustment is needed when moving down the list
      if (newIndex > oldIndex) {
        newIndex--;
      }

      // get the tile we are moving
      final tile = widget.tasks.removeAt(oldIndex);
      // place the tile in the new index
      widget.tasks.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        // Here is an anonymous function named checkboxCallback
        return TaskTile(
            key: ValueKey(widget.tasks[index].name),
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (bool status) {
              setState(() {
                widget.tasks[index].isDone = status;
              });
            });
      },
      itemCount: widget.tasks.length,
      onReorder: (oldIndex, newIndex) {
        updateMyTiles(oldIndex, newIndex);
      },
    );
  }
}
