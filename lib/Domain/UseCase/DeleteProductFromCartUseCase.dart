import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class DeleteProductFromCartUseCase {
  ProductRepository repository ;
  DeleteProductFromCartUseCase(this.repository);

  Future<String?> invoke(String productId ,String token)async{
    var response = await repository.deleteFromCart(productId, token);
    return response;
  }
}