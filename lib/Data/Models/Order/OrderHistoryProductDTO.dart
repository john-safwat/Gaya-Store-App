import 'package:ecommerce/Domain/Models/Order/OrderHistoryProduct.dart';

class OrderHistoryProductDTO {
  OrderHistoryProductDTO({
      this.id, 
      this.orderId, 
      this.productId, 
      this.quantity, 
      this.orderTotal, 
      this.createdAt, 
      this.updatedAt, 
      this.productName,});

  OrderHistoryProductDTO.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    orderTotal = json['orderTotal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productName = json['productName'];
  }
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  double? orderTotal;
  String? createdAt;
  String? updatedAt;
  String? productName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['orderId'] = orderId;
    map['productId'] = productId;
    map['quantity'] = quantity;
    map['orderTotal'] = orderTotal;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['productName'] = productName;
    return map;
  }

  OrderHistoryProduct toDomain(){
    return OrderHistoryProduct(
      id: id,
      quantity: quantity,
      orderTotal: orderTotal,
      productName: productName
    );
  }

}