import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/colors/app_colors.dart';

class DialogButton extends StatefulWidget {
  final String text;
  void Function()? onPressed;

  DialogButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  State<DialogButton> createState() => _DialogButtonState();
}

class _DialogButtonState extends State<DialogButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: widget.onPressed,
      color: AppColors.appBarColor.withOpacity(.8),
      child: Text(widget.text, style: const TextStyle(fontSize: 18, color: Colors.white),),
    );
  }
}
