import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today_app/components/task_tile.dart';
import 'package:today_app/components/tasks_list.dart';
import 'package:today_app/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  static String id = 'Tasks';
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> tasks = [
    'Buy milk',
    'Run 10k Marathon',
    'Get Chat app done A.S.A.P'
  ];
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
            builder: (_) => const AddTaskScreen(),
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
              children: const [
                CircleAvatar(
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
                SizedBox(height: 10.0),
                Text(
                  'Today',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(
                  tasks: [
                    TaskTile(taskName: 'Run 10k Marathon'),
                    TaskTile(taskName: 'Run 10k Marathon')
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
