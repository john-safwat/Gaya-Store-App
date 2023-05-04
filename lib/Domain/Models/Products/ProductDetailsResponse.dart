import 'package:ecommerce/Domain/Models/Products/ProductDetails.dart';

class ProductDetailsResponse {
  ProductDetailsResponse({
      this.status, 
      this.message, 
      this.product,});

  String? status;
  String? message;
  ProductDetails? product;

}