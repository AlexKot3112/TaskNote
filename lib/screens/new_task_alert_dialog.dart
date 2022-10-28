// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:task_notes/widgets/description_textfield.dart';
import 'package:task_notes/widgets/name_textfield.dart';

class AlertDialogWidget extends StatelessWidget {
  VoidCallback onSave;

  final TextEditingController nameController;

  final TextEditingController descriptionController;
  AlertDialogWidget({
    Key? key,
    required this.onSave,
    required this.nameController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 196, 201, 230),
      title: const Center(child: Text('Add New Task')),
      actions: [
        TaskNameTextfieldWidget(
          nameController: nameController,
        ),
        const SizedBox(
          height: 18,
        ),
        TaskDescritionTextfieldWidget(
          descriptionController: descriptionController,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onSave,
              child: const Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
