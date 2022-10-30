// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
              onPressed: onPressed,
              child: Text (text) ,
            );
  }
}
