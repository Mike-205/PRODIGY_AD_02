import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../colors/app_colors.dart';

class ToDoTile extends StatelessWidget {
  final bool value;
  final String text;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onPressed;

  const ToDoTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          Flexible(
            child: Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(left: 5, top: 20),
              child: SlidableAction(
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                onPressed: onPressed,
                icon: Icons.delete,
                label: 'delete',
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          )
        ],
      ),
      child: Container(
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
      ),
    );
  }
}
