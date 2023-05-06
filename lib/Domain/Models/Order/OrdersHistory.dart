import 'OrderHistoryProduct.dart';

class OrdersHistory {
  OrdersHistory({
      this.id, 
      this.shippingState,
      this.total,
      this.createdAt,
      this.products,});

  int? id;
  String? shippingState;
  double? total;
  String? createdAt;
  List<OrderHistoryProduct>? products;

}