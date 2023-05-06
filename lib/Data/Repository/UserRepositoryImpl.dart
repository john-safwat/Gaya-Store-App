import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource remoteDataSource ;
  UserRepositoryImpl(this.remoteDataSource);

  Future<UserData> getUserData(String token)async {
    var response =  await remoteDataSource.getUserData(token);
    return response;
  }

}