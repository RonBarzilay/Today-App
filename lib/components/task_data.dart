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

  bool addTask(String newTaskTitle) {
    // if no duplicates tasks found - true (added),
    // otherwise, false (not added)
    final task = Task(name: newTaskTitle);
    for (Task task in _tasks) {
      if (task.getName == newTaskTitle) {
        return false;
      }
    }
    _tasks.add(task);
    notifyListeners();
    return true;
  }

  void appendTask(Task task) {
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
