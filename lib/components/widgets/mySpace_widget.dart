import 'package:flutter/material.dart';

class MyspaceWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const MyspaceWidget({super.key, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
