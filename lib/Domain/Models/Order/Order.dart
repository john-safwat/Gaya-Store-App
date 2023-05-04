import 'package:ecommerce/Data/Models/Order/OrderDTO.dart';

import 'OrderProducts.dart';

class Order {
  Order({
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

  String? token;
  String? name;
  String? phoneNumber;
  String? address;
  String? cardNumber;
  String? shippingState;
  double? shippingPrice;
  String? postalCode;
  double? total;
  List<OrderProducts>? products;

  OrderDTO toData(){
    return OrderDTO(
      name: name,
      products: products?.map((e) => e.toData()).toList(),
      address: address,
      cardNumber: cardNumber,
      phoneNumber: phoneNumber,
      postalCode: postalCode,
      shippingPrice: shippingPrice,
      shippingState: shippingState,
      token: token,
      total: total
    );
  }
}