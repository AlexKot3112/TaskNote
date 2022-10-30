// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:task_notes/styles/colors.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool taskComplited;
  void Function(bool?)? onChanged;

  TaskCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.taskComplited,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              decoration: taskComplited
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              decoration: taskComplited
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          leading: Checkbox(
            value: taskComplited,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
