import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ApiManager apiManager ;
  ProductRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ProductsResponse> getNewAddedProduct() async{
    var response = await apiManager.getAllNewAddedProducts();
    return response.toDomain();
  }

  @override
  Future<ProductsResponse> getProductsByCategory(double categoryId)async {
    var response = await apiManager.getProductsByCategory(categoryId);
    return response.toDomain();
  }

  @override
  Future<ProductDetailsResponse> getProductDetails(String productId, String token)async{
    var response = await apiManager.getProductDetails(productId, token);
    return response.toDomain();
  }

}