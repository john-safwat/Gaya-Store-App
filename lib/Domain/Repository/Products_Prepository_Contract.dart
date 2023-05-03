import 'package:ecommerce/Domain/Models/CartItemsResponse.dart';
import 'package:ecommerce/Domain/Models/CartProducts.dart';
import 'package:ecommerce/Domain/Models/CartUpdateResponse.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Models/ProductDetails.dart';
import 'package:ecommerce/Domain/Models/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/ProductsResponse.dart';

abstract class ProductRemoteDataSource{
  Future<ProductsResponse> getNewAddedProduct();
  Future<ProductsResponse> getProductsByCategory(double categoryId);
  Future<ProductDetailsResponse> getProductDetails(String productId , String token);
  Future<ProductsResponse> search(String query);
  Future<CartItemsResponse> getCartData(String token);
  Future<CartUpdateResponse> addToCart(String productId , String token );
  Future<CartUpdateResponse> deleteFromCart(String productId , String token );
}

abstract class ProductRepository{
  Future<List<Product>?> getNewAddedProduct();
  Future<List<Product>?> getProductsByCategory(double categoryId);
  Future<ProductDetails?> getProductDetails(String productId , String token);
  Future<String> insertData(Product product);
  Future<String> deleteData(int id);
  Future<List<Product>?> readData();
  Future<List<Product>?> search(String query);
  Future<List<CartProducts>?> getCartData(String token);
  Future<String?> addToCart(String productId , String token );
  Future<String?> deleteFromCart(String productId , String token );
}

abstract class ProductLocalDataSource {
  Future<String> insertData(Product product);
  Future<String> deleteData(int id);
  Future<List<Product>?> readData();
}