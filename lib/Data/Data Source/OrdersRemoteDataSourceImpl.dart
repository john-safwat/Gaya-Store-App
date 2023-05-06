import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderHistoryResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  ApiManager apiManager ;
  OrdersRemoteDataSourceImpl(this.apiManager);

  @override
  Future<OrderResponse> placeOrder(Order order) async{
    var response = await apiManager.placeOrder(order);
    return response!.toDomain();
  }

  @override
  Future<OrderHistoryResponse> getOrderHistory(String token)async {
    var response = await apiManager.getOrderHistory(token);
    return response.toDomain();
  }



}