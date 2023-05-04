import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/Cart/CartItemsResponse.dart';
import 'package:ecommerce/Domain/Models/Cart/CartUpdateResponse.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetailsResponse.dart';
import 'package:ecommerce/Domain/Models/Products/ProductsResponse.dart';
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

  @override
  Future<ProductsResponse> search(String query) async{
    var response = await apiManager.getSearchedProducts(query);
    return response.toDomain();
  }

  @override
  Future<CartItemsResponse> getCartData(String token) async{
    var response = await apiManager.getCartItems(token);
    return response.toDomain();
  }

  @override
  Future<CartUpdateResponse> addToCart(String productId, String token) async{
    var response = await apiManager.addProductToCart(productId, token);
    return response.toDomain();

  }

  @override
  Future<CartUpdateResponse> deleteFromCart(String productId, String token) async{
    var response = await apiManager.deleteProductFromCart(productId, token);
    return response.toDomain();
  }

}