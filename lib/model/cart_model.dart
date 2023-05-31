// ignore_for_file: unnecessary_this

import 'package:e_commerce_with_backend/model/product.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  String? time;
  bool? isExist;
  ProductsModel? product;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExist,
      this.quantity,
      this.time,
      this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    time = json['time'];
    isExist = json['isExist'];
    product = ProductsModel.fromJson(json['product']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      'name': this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      'time': this.time,
      "isExist": this.isExist,
      "product": this.product!.toJson(),
    };
  }
}
