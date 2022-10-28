import 'package:flutter/material.dart';

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
        labelText: 'New task name',
      ),
      autofocus: true,
    );
  }
}
