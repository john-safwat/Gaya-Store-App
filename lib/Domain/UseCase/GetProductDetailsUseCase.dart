import 'package:ecommerce/Domain/Models/Products/ProductDetails.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetProductDetailsUseCase{
  ProductRepository repository ;
  GetProductDetailsUseCase(this.repository);

  Future<ProductDetails?> invoke(String productId , String token)async{
    var response = await repository.getProductDetails(productId, token);
    return response;
  }

}