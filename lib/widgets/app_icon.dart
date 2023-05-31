import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xff756d54),
      this.size = 40,
      this.sizeIcon = 16})
      : super(key: key);
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: sizeIcon,
      ),
    );
  }
}
