import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';

abstract class OrdersRemoteDataSource{
  Future<OrderResponse> placeOrder(Order order);

}

abstract class OrdersRepository{
  Future<OrderResponse> placeOrder(Order order);

}