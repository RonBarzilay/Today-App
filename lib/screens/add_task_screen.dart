import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_app/components/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  static String id = 'New_Task';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = '';
  Color plusButtonColor = Colors.white;
  TextEditingController newTaskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Divider(
                color: Colors.grey.shade400,
                indent: 140,
                endIndent: 140,
                thickness: 3.5,
              ),
            ),
          ),
          const Text(
            'Add Task',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.lightBlueAccent,
              fontSize: 34,
              fontWeight: FontWeight.w600,
              decorationColor: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              autofocus: true,
              maxLines: 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              controller: newTaskTextController,
              onChanged: (newTitle) {
                setState(() {
                  newTaskTitle = newTitle;
                  newTaskTitle == ''
                      ? plusButtonColor = Colors.white
                      : plusButtonColor = Colors.lightBlueAccent;
                });
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {
              newTaskTitle == ''
                  ? null
                  : Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              ),
            ),
            child: Icon(
              Icons.add,
              size: 24,
              color: plusButtonColor,
            ),
          )
        ],
      ),
    );
  }
}
