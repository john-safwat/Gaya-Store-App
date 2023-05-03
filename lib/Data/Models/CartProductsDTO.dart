import 'package:ecommerce/Domain/Models/CartProducts.dart';

import 'CartProductDTO.dart';

class CartProductsDTO {
  CartProductsDTO({
      this.id, 
      this.productId, 
      this.userId, 
      this.cartProduct,});

  CartProductsDTO.fromJson(dynamic json) {
    id = json['id'];
    productId = json['productId'];
    userId = json['userId'];
    cartProduct = json['cartProduct'] != null ? CartProductDTO.fromJson(json['cartProduct']) : null;
  }
  num? id;
  num? productId;
  num? userId;
  CartProductDTO? cartProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['productId'] = productId;
    map['userId'] = userId;
    if (cartProduct != null) {
      map['cartProduct'] = cartProduct?.toJson();
    }
    return map;
  }

  CartProducts toDomain(){
    return CartProducts(
      id: id,
      cartProduct: cartProduct?.toDomain(),
      productId: productId,
      userId: userId
    );
  }

}