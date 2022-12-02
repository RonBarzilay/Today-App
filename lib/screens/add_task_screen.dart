import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController newTaskTextController = TextEditingController();

  @override
  void initState() {
    newTaskTextController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
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
              color: Colors.lightBlueAccent,
              fontSize: 30,
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
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              ),
            ),
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
