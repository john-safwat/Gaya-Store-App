import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';

class OrderResponseDTO {
  OrderResponseDTO({
      this.statusCode, 
      this.message, 
      this.orderNumber, 
      this.userName, 
      this.total, 
      this.shippingCharge,});

  OrderResponseDTO.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    orderNumber = json['orderNumber'];
    userName = json['userName'];
    total = json['total'];
    shippingCharge = json['shippingCharge'];
  }

  int? statusCode;
  String? message;
  int? orderNumber;
  String? userName;
  int? total;
  int? shippingCharge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['orderNumber'] = orderNumber;
    map['userName'] = userName;
    map['total'] = total;
    map['shippingCharge'] = shippingCharge;
    return map;
  }

  OrderResponse toDomain(){
    return OrderResponse(
      total: total,
      message: message,
      orderNumber: orderNumber,
      shippingCharge: shippingCharge,
      statusCode: statusCode,
      userName: userName,
    );
  }

}