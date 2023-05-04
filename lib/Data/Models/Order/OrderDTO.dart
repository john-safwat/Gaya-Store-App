import 'OrderProductsDTO.dart';

class OrderDTO {
  OrderDTO({
      this.token, 
      this.name, 
      this.phoneNumber, 
      this.address, 
      this.cardNumber, 
      this.shippingState, 
      this.shippingPrice, 
      this.postalCode, 
      this.total, 
      this.products,});

  OrderDTO.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    cardNumber = json['cardNumber'];
    shippingState = json['shippingState'];
    shippingPrice = json['shippingPrice'];
    postalCode = json['postalCode'];
    total = json['total'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(OrderProductsDTO.fromJson(v));
      });
    }
  }
  String? token;
  String? name;
  int? phoneNumber;
  String? address;
  String? cardNumber;
  String? shippingState;
  int? shippingPrice;
  int? postalCode;
  int? total;
  List<OrderProductsDTO>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['cardNumber'] = cardNumber;
    map['shippingState'] = shippingState;
    map['shippingPrice'] = shippingPrice;
    map['postalCode'] = postalCode;
    map['total'] = total;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}