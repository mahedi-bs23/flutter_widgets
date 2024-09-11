import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReorderableViewModel {
  ValueNotifier<List<Task>> tasks = ValueNotifier<List<Task>>([]);

  ReorderableViewModel() {
    loadTasks(); // Load saved tasks when ViewModel is initialized
  }

  // Method to reorder the list of tasks and save the new order
  void reorderTasks(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final Task task = tasks.value.removeAt(oldIndex);
    tasks.value.insert(newIndex, task);

    tasks.notifyListeners();
    saveTasks(); // Save tasks after reordering
  }

  // Save the list of tasks to SharedPreferences
  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskTitles = tasks.value.map((task) => task.title).toList();
    prefs.setString('tasks', jsonEncode(taskTitles));
  }

  // Load the list of tasks from SharedPreferences
  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      List<String> taskTitles = List<String>.from(jsonDecode(tasksString));
      tasks.value = taskTitles.map((title) => Task(title)).toList();
    } else {
      // If no tasks are saved, initialize with default tasks
      tasks.value = [
        Task('Task 1'),
        Task('Task 2'),
        Task('Task 3'),
        Task('Task 4'),
        Task('Task 5'),
        Task('Task 6'),
        Task('Task 7'),
        Task('Task 8'),
        Task('Task 9'),
        Task('Task 10'),
        Task('Task 11'),
        Task('Task 12'),
      ];
    }
  }
}
class Task {
  String title;

  Task(this.title);
}

