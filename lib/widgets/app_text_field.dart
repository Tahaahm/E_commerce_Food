// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isObscure = false})
      : super(key: key);
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimentions.width20, right: Dimentions.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimentions.height30),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 7,
              offset: Offset(1, 10)),
        ],
      ),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          //foucs
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.height30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          //first
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.height30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.height30),
          ),
        ),
      ),
    );
  }
}
