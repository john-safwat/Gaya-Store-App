import 'package:ecommerce/Domain/Models/CartProducts.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetCartItemsUseCase {
  ProductRepository repository ;
  GetCartItemsUseCase(this.repository);

  Future<List<CartProducts>?> invoke(String token) async {
    var response = await repository.getCartData(token);
    return response;
  }
}