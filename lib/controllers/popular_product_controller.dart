// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable, unused_element, prefer_interpolation_to_compose_strings, avoid_print

import 'package:e_commerce_with_backend/controllers/cart_controller.dart';
import 'package:e_commerce_with_backend/data/api/repostory/popular_product_repo.dart';
import 'package:e_commerce_with_backend/model/cart_model.dart';
import 'package:e_commerce_with_backend/model/product.dart';
import 'package:e_commerce_with_backend/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int _quantity = 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  int get quantity => _quantity;
  Future<void> getPopularProduct() async {
    Response response = await popularProductRepo.getPopularProductList();
    update();
    if (response.statusCode == 200) {
      print(_popularProductList);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).product);

      update();
      _isLoading = true;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = addQuantity(_quantity + 1);
    } else {
      _quantity = addQuantity(_quantity - 1);
    }
    update();
  }

  int addQuantity(int quantity) {
    if ((_inCartItems + quantity) > 20) {
      Get.snackbar("item Count", "You can't add more",
          colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return 20;
    } else if ((_inCartItems + quantity) < 0) {
      Get.snackbar("item Count", "You can't reduce more",
          colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return 0;
    }
    return quantity;
  }

  void initProduct(CartController cart, ProductsModel product) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    //exist
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantiy(product);
    }
  }

  void addItems(ProductsModel product) {
    _cart.addItem(product, _quantity);

    _cart.getQuantiy(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItem {
    return _cart.getItem;
  }
}
