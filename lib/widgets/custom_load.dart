// ignore_for_file: sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_constructors

import 'package:e_commerce_with_backend/controllers/auth_controller.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("I am printing loading " +
        Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimentions.height50 * 2,
        width: Dimentions.width25 * 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimentions.height25),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
