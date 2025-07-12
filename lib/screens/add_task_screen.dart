import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final TextEditingController _taskController = TextEditingController();

  void _addTask(BuildContext context) {
    final taskTitle = _taskController.text;
    if (taskTitle.isNotEmpty) {
      // Logic to add the task to the provider or database
      Provider.of<TaskProvider>(context, listen: false).addTask(
        Task(id: DateTime.now().toString(), title: taskTitle, isDone: false),
      );
      Navigator.of(context).pop(); // Close the screen after adding
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add TO-DO")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addTask(context),
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
