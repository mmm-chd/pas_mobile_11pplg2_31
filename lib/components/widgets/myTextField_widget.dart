import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MytextfieldWidget extends StatelessWidget {
  final bool isNumber;
  final String label;
  final double? marginTop;
  final TextEditingController controller;
  final bool? obscureText, readOnly;
  final GestureTapCallback? onTap;

  const MytextfieldWidget({
    super.key,
    required this.isNumber,
    required this.label,
    this.marginTop,
    required this.controller,
    this.obscureText,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 0.0),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Color(0xFF1976D2)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        onTap: onTap,
      ),
    );
  }
}
