import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Data/Data%20Source/AuthRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Data%20Source/CategoriesRemoteDataSource.dart';
import 'package:ecommerce/Data/Data%20Source/OrdersRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Data%20Source/ProductLocalDataSourceImpl.dart';
import 'package:ecommerce/Data/Data%20Source/ProductRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Data%20Source/UserRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Repository/AuthRepositoryImpl.dart';
import 'package:ecommerce/Data/Repository/CategoriesRepository.dart';
import 'package:ecommerce/Data/Repository/OrdersRepositoryImpl.dart';
import 'package:ecommerce/Data/Repository/ProductRepositoryImpl.dart';
import 'package:ecommerce/Data/Repository/UserRepositoryImpl.dart';
import 'package:ecommerce/Data/SQL/SQLDB.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropository_Contract.dart';
import 'package:ecommerce/Domain/Repository/Categories_Repository_Contract.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

// api manager instance
ApiManager getApiManger(){
  return ApiManager.getApiManager();
}
// Auth Remote Data Source
AuthRemoteDataSource getAuthRemoteDataSource(ApiManager apiManager){
  return AuthRemoteDataSourceImpl(apiManager);
}
// Auth Repository
AuthRepository getAuthRepository(AuthRemoteDataSource remoteDataSource){
  return AuthRepositoryImpl(remoteDataSource);
}
// function inject
AuthRepository injectAuthRepository(){
  return getAuthRepository(getAuthRemoteDataSource(getApiManger()));
}

// Categories Remote Data Source
CategoriesRemoteDataSource getCategoriesRemoteDataSource(ApiManager apiManager){
  return CategoriesRemoteDataSourceImpl(apiManager);
}
// Categories Repository
CategoriesRepository getCategoriesRepository(CategoriesRemoteDataSource remoteDataSource){
  return CategoriesRepositoryImpl(remoteDataSource);
}
// function inject
CategoriesRepository injectCategoriesRepository(){
  return getCategoriesRepository(getCategoriesRemoteDataSource(getApiManger()));
}

ProductRemoteDataSource getProductRemoteDataSource(ApiManager apiManager) {
  return ProductRemoteDataSourceImpl(apiManager);
}

SQLdb getSQLdb(){
  return SQLdb();
}

ProductLocalDataSource getProductLocalDataSource (SQLdb db){
  return ProductLocalDataSourceImpl(db);
}

ProductRepository getProductRepository(ProductRemoteDataSource remoteDataSource , ProductLocalDataSource localDataSource){
  return ProductRepositoryImpl(remoteDataSource , localDataSource );
}

ProductRepository injectProductRepository(){
  return getProductRepository(getProductRemoteDataSource(getApiManger()),getProductLocalDataSource(getSQLdb()));
}

OrdersRemoteDataSource getOrderRemoteDataSource(ApiManager apiManager){
  return OrdersRemoteDataSourceImpl(apiManager);
}

OrdersRepository getOrdersRepository(OrdersRemoteDataSource remoteDataSource){
  return OrdersRepositoryImpl(remoteDataSource);
}

OrdersRepository injectOrdersRepository(){
  return getOrdersRepository(getOrderRemoteDataSource(getApiManger()));
}

UserRemoteDataSource getUserRemoteDataSource(ApiManager apiManager){
  return UserRemoteDataSourceImpl(apiManager);
}

UserRepository getUserRepository(UserRemoteDataSource remoteDataSource){
  return UserRepositoryImpl(remoteDataSource);
}

UserRepository injectUserRepository(){
  return getUserRepository(getUserRemoteDataSource(getApiManger()));
}
