import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Models/User/UserDataResponse.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  ApiManager apiManager ;
  UserRemoteDataSourceImpl(this.apiManager);


  @override
  Future<UserData> getUserData(String token) async{
    var response = await apiManager.getUserData(token);
    return response.user!.toDomain();
  }

  @override
  Future<UserDataResponse> updateUserData(String? token, String? name, String? phone, String? birthDate, String? password)async {
    var response = await apiManager.updateUserData(token, name, phone, birthDate, password);
    return response.toDomain();
  }

}