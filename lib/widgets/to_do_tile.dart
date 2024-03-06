import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class ToDoTile extends StatelessWidget {
  final bool value;
  final String text;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.value,
    required this.onChanged, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColors.appBarColor.withOpacity(.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          const SizedBox(width: 10,),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              decoration: value? TextDecoration.lineThrough : TextDecoration.none
            )
          )
        ]
      ),
    );
  }
}
