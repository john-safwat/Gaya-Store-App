import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  ApiManager apiManager ;
  UserRemoteDataSourceImpl(this.apiManager);


  @override
  Future<UserData> getUserData(String token) async{
    var response = await apiManager.getUserData(token);
    return response.user!.toDomain();
  }

}