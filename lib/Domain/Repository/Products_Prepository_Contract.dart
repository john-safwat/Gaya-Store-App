import 'package:ecommerce/Domain/Models/ProductsResponse.dart';

abstract class ProductRemoteDataSource{
  Future<ProductsResponse> getNewAddedProduct();
  Future<ProductsResponse> getProductsByCategory(double categoryId);
}

abstract class ProductRepository{
  Future<ProductsResponse> getNewAddedProduct();
  Future<ProductsResponse> getProductsByCategory(double categoryId);
}