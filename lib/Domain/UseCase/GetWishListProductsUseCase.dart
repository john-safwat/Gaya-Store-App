import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetWishListProductsUseCase {
  ProductRepository repository ;
  GetWishListProductsUseCase(this.repository);

  Future<List<Product>?> invoke()async{
    var response = await repository.readData();
    return response;
  }
}