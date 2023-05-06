import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource remoteDataSource ;
  UserRepositoryImpl(this.remoteDataSource);

  Future<UserData> getUserData(String token)async {
    var response =  await remoteDataSource.getUserData(token);
    return response;
  }

  @override
  Future<String?> updateUserData(String? token, String? name, String? phone, String? birthDate, String? password)async {
    var response = await remoteDataSource.updateUserData(token, name, phone, birthDate, password);
    return response.message;
  }

}