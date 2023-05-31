// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/pages/home/food_page_body.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomePage extends StatefulWidget {
  MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  Future<void> _loadingResource() async {
    await Get.find<PopularProductController>().getPopularProduct();
    await Get.find<RecommendProductController>().getRecommendProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.buttonBackgroundColor,
        body: RefreshIndicator(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Dimentions.height45, bottom: Dimentions.height15),
                padding: EdgeInsets.only(
                    left: Dimentions.height15, right: Dimentions.height15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Iraq",
                          color: AppColors.mainColor,
                          size: Dimentions.height25,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Erbil",
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: Dimentions.height45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimentions.height25 - 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: FoodPageBody(),
                ),
              )
            ],
          ),
          onRefresh: _loadingResource,
        ));
  }
}
