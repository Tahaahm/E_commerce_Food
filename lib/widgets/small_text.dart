// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {super.key,
      this.color = const Color(0xffccc7c5),
      required this.text,
      this.size = 0,
      this.height = 1.2});
  Color? color;
  double height;
  final String text;

  double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimentions.height25 / 2 : size,
        height: height,
      ),
    );
  }
}
