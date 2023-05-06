import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class GetOrdersHistoryUseCase {
  OrdersRepository repository ;
  GetOrdersHistoryUseCase(this.repository);

  Future<List<OrdersHistory>?> invoke(String token) async{
    var response = await repository.getOrderHistory(token);
    return response;
  }

}