import 'dart:io';
import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Models/CreateUserResponse.dart';
import 'package:flutter/material.dart';

import '../../Domain/Repository/Auth_Ropsitory_Contract.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<CreateUserResponse?> addNewUser(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String dateTime}) async {
    var response = await apiManager.addNewUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        dateTime: dateTime);
    return response.toDomain();
  }

  @override
  Future<String> uploadUserImage({required File image, required String token}) async {
    var response = await apiManager.uploadUserImage(image, token);
    return response;
  }
}
