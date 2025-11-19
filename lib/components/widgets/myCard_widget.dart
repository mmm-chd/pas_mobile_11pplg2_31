import 'package:flutter/material.dart';

class MycardWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Icon? leadingIcon;

  const MycardWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: leadingIcon,
        contentPadding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
          bottom: 8.0,
        ),
        title: Text(text, style: textStyle),
      ),
    );
  }
}
