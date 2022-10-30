// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:task_notes/costants/text_constants.dart';
import 'package:task_notes/styles/colors.dart';
import 'package:task_notes/widgets/button_widget.dart';
import 'package:task_notes/widgets/description_text_field.dart';
import 'package:task_notes/widgets/name_text_field.dart';

class AlertDialogWidget extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  final TextEditingController nameController;

  final TextEditingController descriptionController;
  AlertDialogWidget({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.nameController,
    required this.descriptionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgColor,
      title: const Center(
        child: Text(add),
      ),
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
            ButtonWidget(
              onPressed: onCancel,
              text: cancel,
            ),
            ButtonWidget(
              onPressed: onSave,
              text: save,
            ),
          ],
        ),
      ],
    );
  }
}
