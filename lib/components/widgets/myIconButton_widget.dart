import 'package:flutter/material.dart';

class MyiconbuttonWidget extends StatelessWidget {
  final IconData? icon;
  final double iconSize, buttonSize;
  final VoidCallback onPressed;
  final Color? backgroundColor, foregroundColor;

  const MyiconbuttonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.iconSize = 24,
    this.buttonSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(buttonSize),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Icon(icon, size: iconSize),
    );
  }
}
