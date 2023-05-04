import 'package:ecommerce/Data/Models/Products/ProductDetailsDTO.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetailsResponse.dart';


class ProductDetailsResponseDTO {
  ProductDetailsResponseDTO({
      this.status, 
      this.message, 
      this.product,});

  ProductDetailsResponseDTO.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    product = json['product'] != null ? ProductDetailsDTO.fromJson(json['product']) : null;
  }
  String? status;
  String? message;
  ProductDetailsDTO? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

  ProductDetailsResponse toDomain(){
    return ProductDetailsResponse(
      message: message,
      status: status,
      product: product?.toDomain(),
    );
  }

}