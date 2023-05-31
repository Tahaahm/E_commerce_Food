// ignore_for_file: prefer_const_constructors, duplicate_ignore, must_be_immutable

import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_icon.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({Key? key, required this.appIcon, required this.bigText})
      : super(key: key);
  AppIcon appIcon;
  BigText bigText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 1,
          offset: Offset(0, 5),
          color: Colors.grey.withOpacity(0.2),
        )
      ]),
      padding: EdgeInsets.only(
          left: Dimentions.width20,
          top: Dimentions.height10,
          bottom: Dimentions.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimentions.width20,
          ),
          bigText,
        ],
      ),
    );
  }
}
