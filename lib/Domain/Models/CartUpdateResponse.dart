import 'CartItem.dart';

class CartUpdateResponse {
  CartUpdateResponse({
      this.code, 
      this.message, 
      this.cartItem,});

  int? code;
  String? message;
  CartItem? cartItem;

}