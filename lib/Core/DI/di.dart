import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Data/Data%20Source/AuthRemoteDataSourceImpl.dart';
import 'package:ecommerce/Data/Repository/AuthRepositoryImpl.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropsitory_Contract.dart';

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