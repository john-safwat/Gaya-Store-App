import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource ;
  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProductsResponse> getNewAddedProduct() {
    var response = remoteDataSource.getNewAddedProduct();
    return response;
  }

}