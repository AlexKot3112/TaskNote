import 'package:flutter/material.dart';

class TaskDescritionTextfieldWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  const TaskDescritionTextfieldWidget({super.key, required this.descriptionController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: 'New task Description',
      ),
    );
  }
}
