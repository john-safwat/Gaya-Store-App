import 'package:ecommerce/Domain/Models/Cart/CartProduct.dart';

class CartProducts {
  CartProducts({
      this.id, 
      this.productId, 
      this.userId, 
      this.cartProduct,});

  num? id;
  num? productId;
  num? userId;
  CartProduct? cartProduct;

}