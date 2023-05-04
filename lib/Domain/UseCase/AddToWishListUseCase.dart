import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class AddToWishListUseCase {
  ProductRepository repository ;
  AddToWishListUseCase(this.repository);

  Future<String> invoke (Product product) async{
    var response = await repository.insertData(product);
    return response;
  }
}
