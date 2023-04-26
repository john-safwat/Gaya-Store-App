import 'package:ecommerce/Domain/Models/ProductsResponse.dart';

abstract class ProductRemoteDataSource{
  Future<ProductsResponse> getNewAddedProduct();
}

abstract class ProductRepository{
  Future<ProductsResponse> getNewAddedProduct();
}