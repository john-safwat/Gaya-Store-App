import 'dart:io';

import 'package:ecommerce/Domain/Models/User/CreateUserResponse.dart';
import 'package:ecommerce/Domain/Models/User/LoginResponse.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropository_Contract.dart';
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<CreateUserResponse> addNewUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String dateTime}) async {

    var response = await remoteDataSource.addNewUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        dateTime: dateTime);
    return response!;
  }

  @override
  Future<String> uploadUserImage({required File image, required String token})async {
    var response = await remoteDataSource.uploadUserImage(token: token , image: image);
    return response;
  }

  @override
  Future<LoginResponse> login({required String email, required String password}) async{
    var response = await remoteDataSource.login(email: email, password: password);
    return response;
  }
}
