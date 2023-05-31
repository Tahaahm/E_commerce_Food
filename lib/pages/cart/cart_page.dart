// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable

import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_icon.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/no_data_page.dart';
import 'package:e_commerce_with_backend/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimentions.width20,
            right: Dimentions.width20,
            height: Dimentions.height35 * 3,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    sizeIcon: Dimentions.height10 * 2.4,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getinitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    sizeIcon: Dimentions.height10 * 2.4,
                  ),
                ),
                SizedBox(
                  width: Dimentions.width15,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  sizeIcon: Dimentions.height10 * 2.4,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimentions.height40 * 2.5,
            left: Dimentions.width20,
            right: Dimentions.width20,
            bottom: 0,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Container(
                  margin: EdgeInsets.only(top: Dimentions.height15),
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return controller.getItem.length > 0
                          ? ListView.builder(
                              itemCount: controller.getItem.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 100,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(controller
                                                  .getItem[index].product);

                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getpopularFood(
                                                    popularIndex, 'cartpage'));
                                          } else {
                                            var recommendIndex = Get.find<
                                                    RecommendProductController>()
                                                .recommendProduct
                                                .indexOf(controller
                                                    .getItem[index].product);

                                            if (recommendIndex < 0) {
                                              Get.snackbar("History Cart",
                                                  "Product review is no available for history product",
                                                  backgroundColor:
                                                      AppColors.mainColor,
                                                  colorText: Colors.white);
                                            } else {
                                              Get.toNamed(
                                                  RouteHelper.getrecommendFood(
                                                      recommendIndex,
                                                      'cartpage'));
                                            }
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: Dimentions.height10),
                                          width: Dimentions.width20 * 5,
                                          height: Dimentions.height50 * 2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimentions.height20,
                                              ),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      AppConstant.BASE_URL +
                                                          AppConstant.UPLOADS +
                                                          controller
                                                              .getItem[index]
                                                              .img!),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimentions.width10,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: Dimentions.height20 * 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: controller
                                                  .getItem[index].name!,
                                              color: Colors.black54,
                                            ),
                                            SmallText(text: "Spicy"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                  text:
                                                      "\$${controller.getItem[index].price!}",
                                                  color: Colors.redAccent,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                    left:
                                                        Dimentions.width10 / 2,
                                                    right:
                                                        Dimentions.width10 / 2,
                                                    top:
                                                        Dimentions.height10 / 2,
                                                    bottom:
                                                        Dimentions.height10 / 2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimentions
                                                                .height20),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.addItem(
                                                              controller
                                                                  .getItem[
                                                                      index]
                                                                  .product!,
                                                              -1);
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimentions.width10 /
                                                                2,
                                                      ),
                                                      BigText(
                                                          text: controller
                                                              .getItem[index]
                                                              .quantity
                                                              .toString()),
                                                      SizedBox(
                                                        width:
                                                            Dimentions.width10 /
                                                                2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.addItem(
                                                              controller
                                                                  .getItem[
                                                                      index]
                                                                  .product!,
                                                              1);
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .signColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimentions.height10,
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              }))
                          : NoDataPage(text: "Your cart is empty");
                    },
                  )),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
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
            child: popularProduct.getItem.length > 0
                ? Row(
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
                        child: BigText(
                            text: "\$" + popularProduct.totalAmount.toString()),
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.addCartHistoryList();
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
                                text: "Check out",
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
