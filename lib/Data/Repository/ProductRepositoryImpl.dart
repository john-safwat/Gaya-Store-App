import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Models/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource ;
  ProductLocalDataSource localDataSource;
  ProductRepositoryImpl(this.remoteDataSource , this.localDataSource);

  @override
  Future<ProductsResponse> getNewAddedProduct() {
    var response = remoteDataSource.getNewAddedProduct();
    return response;
  }

  @override
  Future<ProductsResponse> getProductsByCategory(double categoryId)async {
    var response = await remoteDataSource.getProductsByCategory(categoryId);
    return response;
  }

  @override
  Future<ProductDetailsResponse> getProductDetails(String productId, String token)async {
    var response = await remoteDataSource.getProductDetails(productId, token);
    return response;
  }

  @override
  Future<String> insertData(Product product) async{
    var response = await localDataSource.insertData(product);
    return response;
  }

  @override
  Future<String> deleteData(int id) async{
    var response = await localDataSource.deleteData(id);
    return response;
  }

}