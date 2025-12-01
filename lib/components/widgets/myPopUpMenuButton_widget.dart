import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_01/components/widgets/myText_widget.dart';

class MypopupmenubuttonWidget extends StatelessWidget {
  final double iconSize;
  final Color? iconColor;
  final VoidCallback onTap;
  final String text;

  const MypopupmenubuttonWidget({
    super.key,
    this.iconSize = 22,
    this.iconColor,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, size: iconSize, color: iconColor),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: onTap,
          child: MytextWidget(text: text),
        ),
      ],
    );
  }
}
