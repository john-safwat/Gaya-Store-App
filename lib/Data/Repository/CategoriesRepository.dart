import 'package:ecommerce/Domain/Models/CategoriesResponse.dart';
import 'package:ecommerce/Domain/Repository/Categories_Repository_Contract.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImpl(this.remoteDataSource);
  @override
  Future<CategoriesResponse> getCategories() async{
    var response =  await remoteDataSource.getCategories();
    return response;
  }

}