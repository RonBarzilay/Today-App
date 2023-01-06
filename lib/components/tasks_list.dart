import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:today_app/components/task.dart';
import 'package:today_app/components/task_data.dart';
import 'package:today_app/components/task_tile.dart';

class TasksList extends StatelessWidget {
  FToast fToast = FToast();
  showToast(String msg, Function(Task task) undo, Task task) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(
            width: 5.0,
          ),
          Text(msg),
          TextButton(
              onPressed: () {
                undo(task);
                fToast.removeQueuedCustomToasts();
              },
              child: Text(
                "Undo",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue.shade900),
              ))
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
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
                taskData.deleteTask(task);
                showToast("Task has been deleted",
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
