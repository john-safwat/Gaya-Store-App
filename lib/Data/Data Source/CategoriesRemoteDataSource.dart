import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/Categories/CategoriesResponse.dart';
import 'package:ecommerce/Domain/Repository/Categories_Repository_Contract.dart';

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  ApiManager apiManager;
  CategoriesRemoteDataSourceImpl (this.apiManager);

  @override
  Future<CategoriesResponse> getCategories() async{
    var response = await apiManager.getCategories();
    return response.toDomain();
  }

}