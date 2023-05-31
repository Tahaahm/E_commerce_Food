// ignore_for_file: unused_local_variable

import 'package:e_commerce_with_backend/controllers/auth_controller.dart';
import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/data/api/api_client.dart';
import 'package:e_commerce_with_backend/data/api/repostory/auth_repo.dart';
import 'package:e_commerce_with_backend/data/api/repostory/cart_repo.dart';
import 'package:e_commerce_with_backend/data/api/repostory/popular_product_repo.dart';
import 'package:e_commerce_with_backend/data/api/repostory/recommend_product_repo.dart';
import 'package:e_commerce_with_backend/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));

//CONTROLLER
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendProductController(recommendProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
//REPO
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      AuthRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));
}
