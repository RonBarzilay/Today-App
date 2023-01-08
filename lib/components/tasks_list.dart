import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_app/components/task.dart';
import 'package:today_app/components/task_data.dart';
import 'package:today_app/components/task_tile.dart';

class TasksList extends StatelessWidget {
  final Function fabVisibleCallback;
  final Function showToastCallback;

  TasksList(
      {super.key,
      required this.fabVisibleCallback,
      required this.showToastCallback});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ReorderableListView.builder(
          itemBuilder: (context, index) {
            // Here is an anonymous function named checkboxCallback
            final task = taskData.tasks[index];
            return TaskTile(
              key: ValueKey(task.name),
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool status) {
                taskData.updateTask(task);
              },
              doubleTapCallback: () {
                fabVisibleCallback();
                taskData.deleteTask(task);
                showToastCallback("Task has been deleted",
                    (Task task) => taskData.appendTask(task), task);
              },
            );
          },
          itemCount: taskData.taskCount,
          onReorder: (oldIndex, newIndex) {
            taskData.updateMyTiles(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
