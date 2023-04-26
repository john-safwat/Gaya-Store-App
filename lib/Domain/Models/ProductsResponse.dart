import 'package:ecommerce/Domain/Models/Prdouct.dart';

class ProductsResponse {
  ProductsResponse({
    this.status,
    this.message,
    this.products,});

  String? status;
  String? message;
  List<Product>? products;
}