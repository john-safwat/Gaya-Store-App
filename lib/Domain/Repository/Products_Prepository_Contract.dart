import 'package:ecommerce/Domain/Models/Cart/CartItemsResponse.dart';
import 'package:ecommerce/Domain/Models/Cart/CartProducts.dart';
import 'package:ecommerce/Domain/Models/Cart/CartUpdateResponse.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetails.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/Products/ProductsResponse.dart';

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
  Future<String> deleteWishList();
  Future<List<Product>?> readData();
  Future<List<Product>?> search(String query);
  Future<List<CartProducts>?> getCartData(String token);
  Future<String?> addToCart(String productId , String token );
  Future<String?> deleteFromCart(String productId , String token );
}

abstract class ProductLocalDataSource {
  Future<String> insertData(Product product);
  Future<String> deleteData(int id);
  Future<String> deleteWishList();
  Future<List<Product>?> readData();
}