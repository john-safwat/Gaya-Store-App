import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Models/User/UserDataResponse.dart';

abstract class UserRemoteDataSource {
  Future<UserData> getUserData(String token);
  Future<UserDataResponse> updateUserData(String? token , String? name , String? phone, String? birthDate , String? password);
}

abstract class UserRepository {
  Future<UserData> getUserData(String token);
  Future<String?> updateUserData(String? token , String? name , String? phone, String? birthDate , String? password);

}