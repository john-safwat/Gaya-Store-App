import 'package:ecommerce/Domain/Models/UserModel/UserResponse.dart';

abstract class AuthRemoteDataSource {
  Future<UserResponse?> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });
}

abstract class AuthRepository {
  Future<UserResponse?> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });
}
