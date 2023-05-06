import 'OrderHistoryProduct.dart';

class OrdersHistory {
  OrdersHistory({
      this.id, 
      this.shippingState,
      this.total,
      this.createdAt,
      this.products,});

  num? id;
  String? shippingState;
  num? total;
  String? createdAt;
  List<OrderHistoryProduct>? products;

}