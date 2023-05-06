import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';

import 'OrderHistoryProductDTO.dart';

class OrdersHistoryDTO {
  OrdersHistoryDTO({
      this.id, 
      this.userId, 
      this.name, 
      this.phoneNumber, 
      this.address, 
      this.cardNumber, 
      this.shippingState, 
      this.shippingPrice, 
      this.postalCode, 
      this.total, 
      this.createdAt, 
      this.updatedAt, 
      this.products,});

  OrdersHistoryDTO.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    cardNumber = json['cardNumber'];
    shippingState = json['shippingState'];
    shippingPrice = json['shippingPrice'];
    postalCode = json['postalCode'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(OrderHistoryProductDTO.fromJson(v));
      });
    }
  }
  num? id;
  num? userId;
  String? name;
  String? phoneNumber;
  String? address;
  String? cardNumber;
  String? shippingState;
  num? shippingPrice;
  String? postalCode;
  num? total;
  String? createdAt;
  String? updatedAt;
  List<OrderHistoryProductDTO>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['cardNumber'] = cardNumber;
    map['shippingState'] = shippingState;
    map['shippingPrice'] = shippingPrice;
    map['postalCode'] = postalCode;
    map['total'] = total;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  OrdersHistory toDomain(){
    return OrdersHistory(
      createdAt: createdAt,
      id: id,
      shippingState: shippingState,
      total: total,
      products: products?.map((e) => e.toDomain()).toList()
    );
  }

}