import 'package:ecommerce/Domain/Models/Cart/CartProducts.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetails.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource ;
  ProductLocalDataSource localDataSource;
  ProductRepositoryImpl(this.remoteDataSource , this.localDataSource);

  @override
  Future<List<Product>?> getNewAddedProduct()async {
    var response =await remoteDataSource.getNewAddedProduct();
    return response.products;
  }

  @override
  Future<List<Product>?> getProductsByCategory(double categoryId)async {
    var response = await remoteDataSource.getProductsByCategory(categoryId);
    return response.products;
  }

  @override
  Future<ProductDetails?> getProductDetails(String productId, String token)async {
    var response = await remoteDataSource.getProductDetails(productId, token);
    return response.product;
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

  @override
  Future<List<Product>?> readData() async{
    var response = await localDataSource.readData();
    return response;
  }

  @override
  Future<List<Product>?> search(String query) async{
    var response = await remoteDataSource.search(query);
    return response.products;
  }

  @override
  Future<List<CartProducts>?> getCartData(String token) async{
    var response = await remoteDataSource.getCartData(token);
    return response.cartProducts;
  }

  @override
  Future<String?> addToCart(String productId, String token) async{
    var response = await remoteDataSource.addToCart(productId, token);
    return response.message;
  }

  @override
  Future<String?> deleteFromCart(String productId, String token) async{
    var response = await remoteDataSource.deleteFromCart(productId, token);
    return response.message;
  }

  @override
  Future<String> deleteWishList() async{
    var response = await localDataSource.deleteWishList();
    return response;
  }

}