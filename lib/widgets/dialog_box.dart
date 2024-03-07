import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/colors/app_colors.dart';

import 'my_dialog_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create new Task'),
      backgroundColor: AppColors.primaryColor,
      content: SizedBox(
        height: 140,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "create new task"
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(text: 'Save',onPressed: onSave,),
                const SizedBox(width: 10,),
                DialogButton(text: 'Cancel', onPressed: onCancel,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
