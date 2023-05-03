import 'package:ecommerce/Domain/Models/CartItemsResponse.dart';

import 'CartProductsDTO.dart';

class CartItemsResponseDTO {
  CartItemsResponseDTO({
      this.status, 
      this.message, 
      this.cartProducts,});

  CartItemsResponseDTO.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['cartProducts'] != null) {
      cartProducts = [];
      json['cartProducts'].forEach((v) {
        cartProducts?.add(CartProductsDTO.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<CartProductsDTO>? cartProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (cartProducts != null) {
      map['cartProducts'] = cartProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CartItemsResponse toDomain(){
    return CartItemsResponse(
      status: status,
      message: message,
      cartProducts: cartProducts?.map((e) => e.toDomain()).toList()
    );
  }

}