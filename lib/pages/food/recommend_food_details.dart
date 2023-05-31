// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_icon.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/expanded_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendFoodDetails extends StatelessWidget {
  RecommendFoodDetails({Key? key, required this.pageId, required this.page})
      : super(key: key);
  final int pageId;
  final String page;
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendProductController>().recommendProduct[pageId];

    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimentions.height20),
                          topRight: Radius.circular(Dimentions.height20))),
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimentions.height25 + 1,
                  )),
                ),
              ),
              backgroundColor: AppColors.yellowColor,
              title: GetBuilder<PopularProductController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (page == 'cartpage') {
                              Get.toNamed(RouteHelper.getcartPage());
                            } else {
                              Get.toNamed(RouteHelper.getinitial());
                            }
                          },
                          child: AppIcon(icon: Icons.clear)),
                      GestureDetector(
                        onTap: () {
                          if (controller.totalItems > 0) {
                            Get.toNamed(RouteHelper.getcartPage());
                          } else {
                            Get.snackbar("item count",
                                "You don't have any item inside the cart",
                                colorText: Colors.white,
                                backgroundColor: AppColors.mainColor);
                          }
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            controller.totalItems <= 0
                                ? Container()
                                : Positioned(
                                    right: 0,
                                    top: 2,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          controller.totalItems.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                AppConstant.BASE_URL + AppConstant.UPLOADS + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              )),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimentions.width20, right: Dimentions.width20),
                    child: ExpandedTextWidget(text: product.description!),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        sizeIcon: 20,
                      ),
                    ),
                    SizedBox(
                      width: Dimentions.width15,
                    ),
                    BigText(
                        text:
                            "\$ ${product.price} X ${controller.inCartItems}"),
                    SizedBox(
                      width: Dimentions.width15,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        sizeIcon: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimentions.height10,
                ),
                Container(
                  height: Dimentions.height20 * 6,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimentions.height40),
                      topRight: Radius.circular(
                        Dimentions.height40,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      top: Dimentions.height30,
                      bottom: Dimentions.height30,
                      left: Dimentions.width20,
                      right: Dimentions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: Dimentions.width20,
                              right: Dimentions.width20,
                              top: Dimentions.height20,
                              bottom: Dimentions.height20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimentions.height20),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                          )),
                      GestureDetector(
                        onTap: () {
                          controller.addItems(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: Dimentions.width20,
                              right: Dimentions.width20,
                              top: Dimentions.height20,
                              bottom: Dimentions.height20),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimentions.height20),
                            color: AppColors.mainColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text: "\$ ${product.price!} | add to Cart",
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
