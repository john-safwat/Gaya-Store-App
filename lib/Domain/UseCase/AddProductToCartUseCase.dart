import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class AddProductToCartUseCase{
  ProductRepository repository ;
  AddProductToCartUseCase(this.repository);

  Future<String?> invoke(String productId , String token) async{
    var response = await repository.addToCart(productId, token);
    return response;
  }

}