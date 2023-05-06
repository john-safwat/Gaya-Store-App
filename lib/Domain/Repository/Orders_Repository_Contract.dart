import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderHistoryResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';

abstract class OrdersRemoteDataSource{
  Future<OrderResponse> placeOrder(Order order);
  Future<OrderHistoryResponse> getOrderHistory(String token);
}

abstract class OrdersRepository{
  Future<OrderResponse> placeOrder(Order order);
  Future<List<OrdersHistory>?> getOrderHistory(String token);

}