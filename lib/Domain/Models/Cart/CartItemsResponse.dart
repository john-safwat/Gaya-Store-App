

import 'package:ecommerce/Domain/Models/Cart/CartProducts.dart';

class CartItemsResponse {
  CartItemsResponse({
      this.status, 
      this.message, 
      this.cartProducts,});

  String? status;
  String? message;
  List<CartProducts>? cartProducts;

}