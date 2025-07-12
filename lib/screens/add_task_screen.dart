import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _addTask(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final taskTitle = _taskController.text;
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskController,
                decoration: InputDecoration(labelText: 'Task Title'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _addTask(context),
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
