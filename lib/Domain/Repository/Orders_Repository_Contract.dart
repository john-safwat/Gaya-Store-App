import 'package:ecommerce/Data/Models/Payment/Request/OrderRegestration/OrderRegestrationRequestDTO.dart';
import 'package:ecommerce/Data/Models/Payment/Request/PaymentKeyRequest/PaymentKeyRequestDTO.dart';
import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderHistoryResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:ecommerce/Domain/Models/Payment/Request/OrderRegestration/Items.dart';

abstract class OrdersRemoteDataSource{
  Future<OrderResponse> placeOrder(Order order);
  Future<OrderHistoryResponse> getOrderHistory(String token);
}

abstract class OrdersRepository{
  Future<OrderResponse> placeOrder(Order order);
  Future<List<OrdersHistory>?> getOrderHistory(String token);
  Future<String> authRequest();
  Future<String> orderRegistrationRequest({required String authToken, required int total, required List<Items> products , required String id});
  Future<String> paymentKeyRequest({String? authToken ,String? id ,required int total});
}

abstract class PaymentRemoteDataSource{
  Future<String> authRequest();
  Future<String> orderRegistrationRequest(OrderRegistrationRequestDTO orderRegistrationRequest);
  Future<String> paymentKeyRequest(PaymentKeyRequestDTO paymentKeyRequestDTO);
}