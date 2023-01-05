import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:today_app/components/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Get my Chat App done A.S.A.P'),
    Task(name: 'Buy milk'),
    Task(name: 'Run 10k Marathon'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // Reorder method
  void updateMyTiles(oldIndex, newIndex) {
    // an adjustment is needed when moving down the list
    if (newIndex > oldIndex) {
      newIndex--;
    }

    // get the tile we are moving
    final tile = _tasks.removeAt(oldIndex);
    // place the tile in the new index
    _tasks.insert(newIndex, tile);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
