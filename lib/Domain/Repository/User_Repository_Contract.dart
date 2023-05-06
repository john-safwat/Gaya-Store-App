import 'package:ecommerce/Domain/Models/User/UserData.dart';

abstract class UserRemoteDataSource {
  Future<UserData> getUserData(String token);
}

abstract class UserRepository {
  Future<UserData> getUserData(String token);
}