import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:today_app/components/tasks_list.dart';
import 'package:today_app/screens/add_task_screen.dart';

import '../components/task.dart';
import '../components/task_data.dart';

class TasksScreen extends StatefulWidget {
  static String id = 'Tasks';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool isFabVisible = true;
  FToast fToast = FToast();

  void fabVisible() {
    setState(() {
      isFabVisible = !isFabVisible;
    });
  }

  void showToast(String msg, Function(Task task) undo, Task task) {
    // return true - if undo pressed, otherwise return false
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
            ),
          )
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      fabCallback: () {
        Future.delayed(Duration.zero, () async {
          fabVisible();
        });
      },
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          autofocus: false,
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (_) =>
                  AddTaskScreen(fabVisibleCallback: () => fabVisible()),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Today',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TasksList(
                  fabVisibleCallback: () => fabVisible(),
                  showToastCallback:
                      (String msg, Function(Task task) undo, Task task) =>
                          showToast(msg, undo, task),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
