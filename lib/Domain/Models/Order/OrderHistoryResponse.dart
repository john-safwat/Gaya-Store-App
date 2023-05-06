import 'OrdersHistory.dart';

class OrderHistoryResponse {
  OrderHistoryResponse({
      this.statusCode,
      this.message, 
      this.orders,});

  int? statusCode;
  String? message;
  List<OrdersHistory>? orders;

}