// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, unused_field, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_is_empty

import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/model/product.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:e_commerce_with_backend/utils/dimention.dart';
import 'package:e_commerce_with_backend/widgets/app_column.dart';
import 'package:e_commerce_with_backend/widgets/big_text.dart';
import 'package:e_commerce_with_backend/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_with_backend/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimentions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: ((controller) {
          return controller.isLoading
              ? Container(
                  height: Dimentions.pageView,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: controller.popularProductList.length,
                      itemBuilder: ((context, postion) {
                        return _buildPageItem(
                            postion, controller.popularProductList[postion]);
                      })),
                )
              : Center(
                  child: CircularProgressIndicator(color: AppColors.mainColor),
                );
        })),
        GetBuilder<PopularProductController>(builder: ((controller) {
          return DotsIndicator(
            dotsCount: controller.popularProductList.length <= 0
                ? 1
                : controller.popularProductList.length,
            position: currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        })),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimentions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimentions.width10,
              ),
              Container(
                child: SmallText(
                  text: "Food Paring",
                ),
              ),
            ],
          ),
        ),
        GetBuilder<RecommendProductController>(builder: ((controller) {
          return controller.isLoading
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.recommendProduct.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getrecommendFood(index, 'home'));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: Dimentions.width20,
                            left: Dimentions.width20,
                            bottom: Dimentions.height10),
                        child: Row(
                          children: [
                            //image section
                            Container(
                              width: Dimentions.listViewImg,
                              height: Dimentions.listViewImg,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimentions.height20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    image: NetworkImage(AppConstant.BASE_URL +
                                        AppConstant.UPLOADS +
                                        controller
                                            .recommendProduct[index].img!),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimentions.listViewTextContSize,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimentions.height20),
                                        bottomRight: Radius.circular(
                                            Dimentions.height20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimentions.height15,
                                      left: Dimentions.width15,
                                      right: Dimentions.width25),
                                  child: AppColumn(
                                    text: controller
                                        .recommendProduct[index].name!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
              : Center(
                  child: CircularProgressIndicator(color: AppColors.mainColor),
                );
        }))
      ],
    );
  }

  Widget _buildPageItem(int index, ProductsModel product) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (currPageValue - index + 1) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - _scaleFactor);
      var currTans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getpopularFood(index, 'home'));
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: Dimentions.width10, right: Dimentions.width10),
              height: Dimentions.pageViewContainer,
              decoration: BoxDecoration(
                color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(AppConstant.BASE_URL +
                        AppConstant.UPLOADS +
                        product.img!),
                    fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimentions.width30,
                    right: Dimentions.width30,
                    bottom: Dimentions.height30),
                height: Dimentions.pageViewTextContainer,
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: Dimentions.height10 / 2,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimentions.width15,
                      right: Dimentions.width15,
                      top: Dimentions.height15,
                      bottom: Dimentions.height10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: product.name!),
                      SizedBox(
                        height: Dimentions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star_rate_rounded,
                                      color: AppColors.mainColor,
                                      size: Dimentions.height15,
                                    )),
                          ),
                          SizedBox(width: Dimentions.height10),
                          SmallText(text: "4.5"),
                          SizedBox(
                            width: Dimentions.height10,
                          ),
                          SmallText(text: "1287"),
                          SizedBox(
                            width: Dimentions.height10,
                          ),
                          SmallText(text: "comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimentions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle,
                              text: "Normal",
                              iconColor: AppColors.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "1.7km",
                              iconColor: AppColors.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "32min",
                              iconColor: AppColors.iconColor2)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
