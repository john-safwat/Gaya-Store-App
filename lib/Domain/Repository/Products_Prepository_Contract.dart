import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Models/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/ProductsResponse.dart';

abstract class ProductRemoteDataSource{
  Future<ProductsResponse> getNewAddedProduct();
  Future<ProductsResponse> getProductsByCategory(double categoryId);
  Future<ProductDetailsResponse> getProductDetails(String productId , String token);
}

abstract class ProductRepository{
  Future<ProductsResponse> getNewAddedProduct();
  Future<ProductsResponse> getProductsByCategory(double categoryId);
  Future<ProductDetailsResponse> getProductDetails(String productId , String token);
  Future<String> insertData(Product product);
  Future<String> deleteData(int id);
  Future<List<Product>?> readData();

}

abstract class ProductLocalDataSource {
  Future<String> insertData(Product product);
  Future<String> deleteData(int id);
  Future<List<Product>?> readData();
}