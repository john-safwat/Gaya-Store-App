import 'package:ecommerce/Domain/Models/ProductsResponse.dart';

import 'ProductsDTO.dart';

class ProductsResponseDTO {
  ProductsResponseDTO({
      this.status, 
      this.message, 
      this.page, 
      this.products,});

  ProductsResponseDTO.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    page = json['page'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDTO.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  num? page;
  List<ProductsDTO>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['page'] = page;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  ProductsResponse toDomain(){
    return ProductsResponse(
      status: status,
      message: message,
      products: products!.map((e) => e.toDomain()).toList()
    );
  }

}