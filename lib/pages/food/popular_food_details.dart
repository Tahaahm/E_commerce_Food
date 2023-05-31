// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_column.dart';
import 'package:e_commerce_with_backend/widgets/app_icon.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/expanded_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  final int pageId;
  final String page;
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>(), product);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimentions.popularFoodSizeImg,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(AppConstant.BASE_URL +
                            AppConstant.UPLOADS +
                            product.img!),
                        fit: BoxFit.cover)),
              ),
            ),
            GetBuilder<PopularProductController>(builder: ((controller) {
              return Positioned(
                top: Dimentions.height45,
                left: Dimentions.width15,
                right: Dimentions.width15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (page == "cartpage") {
                            Get.toNamed(RouteHelper.getcartPage());
                          } else {
                            Get.toNamed(RouteHelper.getinitial());
                          }
                        },
                        child: AppIcon(icon: Icons.arrow_back_ios)),
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
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            })),
            Positioned(
              top: Dimentions.popularFoodSizeImg - 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                    top: Dimentions.height20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimentions.height20),
                        topRight: Radius.circular(Dimentions.height20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimentions.height20,
                    ),
                    BigText(
                      text: "Introduce",
                    ),
                    SizedBox(
                      height: Dimentions.height15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandedTextWidget(text: product.description),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
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
                      borderRadius: BorderRadius.circular(Dimentions.height20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(
                            Icons.remove,
                            color: AppColors.signColor,
                          ),
                        ),
                        SizedBox(
                          width: Dimentions.width10 / 2,
                        ),
                        BigText(text: popularProduct.inCartItems.toString()),
                        SizedBox(
                          width: Dimentions.width10 / 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.signColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.addItems(product);
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
            );
          },
        ));
  }
}
