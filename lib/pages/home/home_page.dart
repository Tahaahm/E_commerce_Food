// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_field, prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:e_commerce_with_backend/pages/account/acount_page.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_in_page.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_up_page.dart';
import 'package:e_commerce_with_backend/pages/cart/cart_history.dart';
import 'package:e_commerce_with_backend/pages/home/main_food_page.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;
  List pages = [
    MainHomePage(),
    SignInPage(),
    CartHistory(),
    AccountPage(),
  ];
  void onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.yellowColor,
          selectedItemColor: AppColors.mainColor,
          currentIndex: _selectIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: "history",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Me"),
          ],
          onTap: onTap),
    );
  }
}
