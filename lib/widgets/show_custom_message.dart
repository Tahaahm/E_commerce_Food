// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomerSnackBar(String message,
    {bool isError = true, String title = "Error", Color colors = Colors.red}) {
  Get.snackbar(title, message,
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      colorText: Colors.white,
      backgroundColor: colors);
}
