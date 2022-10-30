import 'package:flutter/material.dart';
import 'package:task_notes/costants/text_constants.dart';

class TaskNameTextfieldWidget extends StatelessWidget {
  final TextEditingController nameController;

  const TaskNameTextfieldWidget({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: name,
      ),
      autofocus: true,
    );
  }
}
