// ignore_for_file: must_be_immutable

import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText(
      {super.key,
      this.color = const Color(0xff332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0});
  Color? color;
  final String text;
  TextOverflow overflow;
  double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimentions.height20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
