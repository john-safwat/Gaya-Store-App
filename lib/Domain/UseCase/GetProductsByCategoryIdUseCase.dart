import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetProductsByCategoryIdUseCase {
  ProductRepository repository ;
  GetProductsByCategoryIdUseCase(this.repository);
  Future<ProductsResponse> invoke(double categoryId) async{
    var response = await repository.getProductsByCategory(categoryId);
    return response;
  }
}