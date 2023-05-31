// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadingResource() async {
    await Get.find<PopularProductController>().getPopularProduct();
    await Get.find<RecommendProductController>().getRecommendProduct();
  }

  @override
  void initState() {
    super.initState();
    _loadingResource();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(curve: Curves.linear, parent: controller);

    Timer(Duration(seconds: 3), () => Get.toNamed(RouteHelper.getinitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/image/logo part 1.png",
                width: Dimentions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/logo part 2.png",
              width: Dimentions.splashImg,
            ),
          ),
        ],
      ),
    );
  }
}
