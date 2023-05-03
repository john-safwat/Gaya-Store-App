import 'package:ecommerce/Domain/Models/CartItem.dart';

class CartItemDTO {
  CartItemDTO({
      this.userId, 
      this.productId, 
      this.id,});

  CartItemDTO.fromJson(dynamic json) {
    userId = json['userId'];
    productId = json['productId'];
    id = json['id'];
  }
  int? userId;
  int? productId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['productId'] = productId;
    map['id'] = id;
    return map;
  }

  CartItem toDomain(){
    return CartItem(
      id: id,
      productId: productId,
      userId: userId,
    );
  }
}