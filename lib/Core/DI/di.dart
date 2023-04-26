import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Data/Data%20Source/AuthRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Data%20Source/CategoriesRemoteDataSource.dart';
import 'package:ecommerce/Data/Data%20Source/ProductRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Repository/AuthRepositoryImpl.dart';
import 'package:ecommerce/Data/Repository/CategoriesRepository.dart';
import 'package:ecommerce/Data/Repository/ProductRepositoryImpl.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropository_Contract.dart';
import 'package:ecommerce/Domain/Repository/Categories_Repository_Contract.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

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

ProductRepository getProductRepository(ProductRemoteDataSource remoteDataSource){
  return ProductRepositoryImpl(remoteDataSource);
}

ProductRepository injectProductRepository(){
  return getProductRepository(getProductRemoteDataSource(getApiManger()));
}

