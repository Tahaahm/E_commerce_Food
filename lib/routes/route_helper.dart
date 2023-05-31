// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable

import 'package:e_commerce_with_backend/pages/cart/cart_page.dart';
import 'package:e_commerce_with_backend/pages/food/popular_food_details.dart';
import 'package:e_commerce_with_backend/pages/food/recommend_food_details.dart';
import 'package:e_commerce_with_backend/pages/home/home_page.dart';
import 'package:e_commerce_with_backend/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendFood = "/recommend-food";
  static const String cartPage = "/cart-page";
  static const String splashPage = "/splash-page";

  static String getinitial() => "$initial";
  static String getpopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getrecommendFood(int pageId, String page) =>
      "$recommendFood?pageId=$pageId&page=$page";
  static String getcartPage() => "$cartPage";
  static String getsplashPage() => "$splashPage";

  static List<GetPage> route = [
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var page = Get.parameters['page'];
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(
            pageId: int.parse(
              pageId!,
            ),
            page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: recommendFood,
        page: () {
          var page = Get.parameters['page'];
          var pageId = Get.parameters['pageId'];
          return RecommendFoodDetails(
            page: page!,
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
      name: splashPage,
      page: () => SplashPage(),
    ),
  ];
}
