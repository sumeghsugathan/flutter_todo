import 'package:flutter/material.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/uidesigns.dart';

class DialogBox extends StatelessWidget {
  final dynamic controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryColor,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new Text",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UiHelper.myButton("Save", onSave, AppColors.primaryColor),
                UiHelper.myButton("Cancel", onCancel, AppColors.primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
