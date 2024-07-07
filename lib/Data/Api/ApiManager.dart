import 'dart:convert';
import 'dart:io';

import "package:async/async.dart";
import 'package:ecommerce/Data/Models/Cart/CartUpdateResponseDTO.dart';
import 'package:ecommerce/Data/Models/Order/OrderHistoryResponseDTO.dart';
import 'package:ecommerce/Data/Models/Order/OrderResponseDTO.dart';
import 'package:ecommerce/Data/Models/Products/ProductDetailsResponseDTO.dart';
import 'package:ecommerce/Data/Models/Products/ProductsResponseDTO.dart';
import 'package:ecommerce/Data/Models/User/CreateUserResponseDTO.dart';
import 'package:ecommerce/Data/Models/User/LoginResponseDTO.dart';
import 'package:ecommerce/Data/Models/User/UserDataResponseDTO.dart';
import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../Models/Cart/CartItemsResponseDTO.dart';
import '../Models/Categories/CategoriesResponseDTO.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getApiManager() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  String baseUrl = '192.168.1.10';
  String addUserRoute = '/Gaya-Store/public/api/users/create';
  String addUserImageRoute = '/Gaya-Store/public/api/users/uploadImage';
  String loginRoute = '/Gaya-Store/public/api/users/login';
  String getCategoriesRoute = '/Gaya-Store/public/api/home/category/categories';
  String getAllNewAddedProductsRoute = '/Gaya-Store/public/api/home/product/allNewAddedProducts';
  String getProductsByCategoryRoute = '/Gaya-Store/public/api/home/product/getProductsByCategory';
  String getProductDetailsRoute = '/Gaya-Store/public/api/home/product/productDetails';
  String getSearchedProductsRoute = '/Gaya-Store/public/api/home/product/productSearch';
  String getCartProductsRoute = '/Gaya-Store/public/api/home/product/cart';
  String addProductToCartRoute = '/Gaya-Store/public/api/home/product/addToCart';
  String deleteProductFromCartRoute = '/Gaya-Store/public/api/home/product/deleteFromCart';
  String addOrderRoute = '/Gaya-Store/public/api/home/order/addOrder';
  String getUserDataRoute = '/Gaya-Store/public/api/users/userData';
  String getOrderHistoryRoute = '/Gaya-Store/public/api/home/order/getOrdersHistory';
  String updateUserDataRoute = "/Gaya-Store/public/api/users/updateUserData";

  // function to call database to add user
  Future<CreateUserResponseDTO> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  }) async {
    Uri uri = Uri.http(baseUrl, addUserRoute);
    var response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'birthDate': dateTime,
    });
    return CreateUserResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to update user image
  Future<String> uploadUserImage(File image, String token) async {
    Uri uri = Uri.http(baseUrl, addUserImageRoute);

    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("image", stream, length,
        filename: basename(image.path));
    request.files.add(multipartFile);
    request.fields['token'] = token;
    var respond = await request.send();
    if (respond.statusCode == 200) {
      return "Image Uploaded";
    } else {
      return "Upload Failed";
    }
  }

  // function to login
  Future<LoginResponseDTO> login(String email, String password) async {
    Uri uri = Uri.http(baseUrl, loginRoute);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });
    return LoginResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to get the categories data
  Future<CategoriesResponseDTO> getCategories() async {
    Uri uri = Uri.http(baseUrl, getCategoriesRoute);
    var response = await http.get(uri);
    return CategoriesResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to get all new added products
  Future<ProductsResponseDTO> getAllNewAddedProducts() async {
    Uri url = Uri.http(baseUrl, getAllNewAddedProductsRoute);
    var response = await http.get(url);
    return ProductsResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to get products by category
  Future<ProductsResponseDTO> getProductsByCategory(double categoryId) async {
    Uri url = Uri.http(baseUrl, getProductsByCategoryRoute,
        {'categoryId': categoryId.toString()});
    var response = await http.get(url);
    return ProductsResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to get product Details
  Future<ProductDetailsResponseDTO> getProductDetails(
      String productId, String token) async {
    Uri url = Uri.http(baseUrl, getProductDetailsRoute, {
      'product_id': productId,
      'token': token,
    });
    var response = await http.get(url);
    return ProductDetailsResponseDTO.fromJson(jsonDecode(response.body));
  }

  //function to get the products we search for
  Future<ProductsResponseDTO> getSearchedProducts(String query) async {
    Uri url = Uri.http(baseUrl, getSearchedProductsRoute, {
      'query_term': query,
    });
    var response = await http.get(url);
    return ProductsResponseDTO.fromJson(jsonDecode(response.body));
  }

  // get cart products
  Future<CartItemsResponseDTO> getCartItems(String token) async {
    Uri url = Uri.http(baseUrl, getCartProductsRoute, {'token': token});
    var response = await http.get(url);
    return CartItemsResponseDTO.fromJson(jsonDecode(response.body));
  }

  // add product to cart
  Future<CartUpdateResponseDTO> addProductToCart(
      String productId, String token) async {
    Uri url = Uri.http(baseUrl, addProductToCartRoute);
    var response = await http.post(url, body: {
      'token': token,
      'productId': productId,
    });

    return CartUpdateResponseDTO.fromJson(jsonDecode(response.body));
  }

  // delete product from cart
  Future<CartUpdateResponseDTO> deleteProductFromCart(
      String productId, String token) async {
    Uri url = Uri.http(baseUrl, deleteProductFromCartRoute);
    var response = await http.post(url, body: {
      'token': token,
      'productId': productId,
    });
    return CartUpdateResponseDTO.fromJson(jsonDecode(response.body));
  }

  // place order
  Future<OrderResponseDTO?> placeOrder(Order order) async {
    Uri url = Uri.http(baseUrl, addOrderRoute);
    var response = await http.post(url, headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(order.toData().toJson()).toString());
    return OrderResponseDTO.fromJson(jsonDecode(response.body));
  }

  // get user data from database
  Future<UserDataResponseDTO> getUserData(String token)async{
    Uri url = Uri.http(baseUrl , getUserDataRoute , {'token' : token});
    var response = await http.get(url);
    return UserDataResponseDTO.fromJson(jsonDecode(response.body));
  }

  Future<OrderHistoryResponseDTO> getOrderHistory(String token) async{
    Uri url = Uri.http(baseUrl , getOrderHistoryRoute , {'token' : token});
    var response =  await http.get(url);
    return OrderHistoryResponseDTO.fromJson(jsonDecode(response.body));
  }

  Future<UserDataResponseDTO> updateUserData(String? token , String? name , String? phone, String? birthDate , String? password ) async {
    Uri url = Uri.http(baseUrl , updateUserDataRoute);
    if(password != null){
      var response = await http.post(url , body: {
        'token' : token,
        'name' : name ,
        'phone' :phone,
        'birthDate' : birthDate,
        'password' : password
      });
      return UserDataResponseDTO.fromJson(jsonDecode(response.body));
    }else{
      var response = await http.post(url , body: {
        'token' : token,
        'name' : name ,
        'phone' :phone,
        'birthDate' : birthDate,
      });
      return UserDataResponseDTO.fromJson(jsonDecode(response.body));
    }
  }
}
