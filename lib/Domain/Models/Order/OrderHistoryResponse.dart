import 'OrdersHistory.dart';

class OrderHistoryResponse {
  OrderHistoryResponse({
      this.statusCode,
      this.message, 
      this.orders,});

  num? statusCode;
  String? message;
  List<OrdersHistory>? orders;

}