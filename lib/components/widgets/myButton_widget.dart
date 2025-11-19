import 'package:flutter/material.dart';

class MybuttonWidget extends StatelessWidget {
  final String text;
  final double? margin;
  final Color? backgroundColor, foregroundColor;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;

  const MybuttonWidget({
    super.key,
    required this.text,
    this.margin,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin ?? 0.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 5,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          shape:
              shape ??
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        child: Text(text, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
