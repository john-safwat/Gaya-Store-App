import 'dart:io';

import 'package:ecommerce/Domain/Models/CreateUserResponse.dart';

abstract class AuthRemoteDataSource {
  Future<CreateUserResponse?> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });

  Future<String> uploadUserImage({required File image , required String token});
}

abstract class AuthRepository {
  Future<CreateUserResponse?> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });

  Future<String> uploadUserImage({required File image , required String token});

}
