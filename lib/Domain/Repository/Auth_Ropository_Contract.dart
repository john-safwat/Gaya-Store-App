import 'dart:io';

import 'package:ecommerce/Domain/Models/User/CreateUserResponse.dart';
import 'package:ecommerce/Domain/Models/User/LoginResponse.dart';

abstract class AuthRemoteDataSource {
  Future<CreateUserResponse?> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });

  Future<String> uploadUserImage({required File image , required String token});
  Future<LoginResponse> login ({required String email ,  required String password});
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
  Future<LoginResponse> login ({required String email ,  required String password});

}
