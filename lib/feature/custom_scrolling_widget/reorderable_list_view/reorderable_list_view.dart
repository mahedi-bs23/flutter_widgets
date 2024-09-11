import 'package:flutter/material.dart';
import 'reorderable_list_viewmodel.dart';

class ReorderAbleListView extends StatefulWidget {
  ReorderAbleListView({super.key});

  @override
  State<ReorderAbleListView> createState() => _ReorderAbleListViewState();
}

class _ReorderAbleListViewState extends State<ReorderAbleListView> {
  final ReorderableViewModel reorderableViewModel = ReorderableViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable Task List'),
      ),
      body: ValueListenableBuilder<List<Task>>(
        valueListenable: reorderableViewModel.tasks,
        builder: (context, tasks, child) {
          return ReorderableListView(
            padding: const EdgeInsets.all(10),
            children: tasks.map((task) {
              return Container(
                key: ValueKey(task.title),
                // Use task.title for unique Key
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(10)),
                //key: ValueKey(task.title),  // Use task.title for unique Key
                child: Text(
                  task.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onReorder: (oldIndex, newIndex) {
              reorderableViewModel.reorderTasks(oldIndex, newIndex);
              print('Reordering from $oldIndex to $newIndex');
            },
          );
        },
      ),
    );
  }
}
