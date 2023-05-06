import 'package:ecommerce/Domain/Models/Order/OrderHistoryResponse.dart';

import 'OrdersHistoryDTO.dart';

class OrderHistoryResponseDTO {
  OrderHistoryResponseDTO({
      this.statusCode,
      this.message, 
      this.orders,});

  OrderHistoryResponseDTO.fromJson(dynamic json) {
    statusCode = json['status code'];
    message = json['message'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(OrdersHistoryDTO.fromJson(v));
      });
    }
  }
  num? statusCode;
  String? message;
  List<OrdersHistoryDTO>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status code'] = statusCode;
    map['message'] = message;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  OrderHistoryResponse toDomain(){
    return OrderHistoryResponse(
      statusCode: statusCode,
      message: message,
      orders:orders?.map((e) => e.toDomain()).toList()
    );
  }

}