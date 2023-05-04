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
  int? phoneNumber;
  String? address;
  String? cardNumber;
  String? shippingState;
  int? shippingPrice;
  int? postalCode;
  int? total;
  List<OrderProducts>? products;

}