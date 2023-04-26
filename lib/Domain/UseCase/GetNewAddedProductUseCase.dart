import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetNewAddedProductsUseCase {
  ProductRepository repository ;
  GetNewAddedProductsUseCase(this.repository);
  Future<ProductsResponse> invoke(){
    var response = repository.getNewAddedProduct();
    return response;
  }
}