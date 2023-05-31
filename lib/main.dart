// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/controllers/popular_product_controller.dart';
import 'package:e_commerce_with_backend/controllers/recommend_product_controller.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_in_page.dart';
import 'package:e_commerce_with_backend/pages/auth/sign_up_page.dart';
import 'package:e_commerce_with_backend/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_with_backend/helper/dependencies.dart' as def;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await def.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: ((_) {
      return GetBuilder<RecommendProductController>(builder: ((_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: SignInPage(),
          initialRoute: RouteHelper.getsplashPage(),
          getPages: RouteHelper.route,
        );
      }));
    }));
  }
}
