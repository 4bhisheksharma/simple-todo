import 'package:flutter/material.dart';

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
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
          color: isDone ? Colors.grey : Colors.black,
          fontSize: 18,
        ),
      ),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: isDone ? Colors.grey[200] : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
