// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);
  final IconData icon;
  final String text;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: Dimentions.width10 / 2,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
