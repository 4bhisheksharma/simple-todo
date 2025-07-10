import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskId;
  final String taskTitle;
  final bool isDone;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.taskId,
    required this.taskTitle,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
