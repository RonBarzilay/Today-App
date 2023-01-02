import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_app/components/tasks_list.dart';
import 'package:today_app/screens/add_task_screen.dart';

import '../components/task.dart';

class TasksScreen extends StatefulWidget {
  List<Task> tasks = [
    Task(name: 'Get my Chat App done A.S.A.P'),
    Task(name: 'Buy milk'),
    Task(name: 'Run 10k Marathon'),
  ];
  static String id = 'Tasks';
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void addTask(Task task) {
    setState(() {
      widget.tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (_) => AddTaskScreen(
              addTaskCallback: (newTaskTitle) {
                setState(() {
                  widget.tasks.add(Task(name: newTaskTitle));
                });
              },
            ),
          );
        },
        child: const Icon(Icons.add),
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
                  '${widget.tasks.length} Tasks',
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
                child: TasksList(tasks: widget.tasks),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
