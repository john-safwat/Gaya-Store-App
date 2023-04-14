import 'dart:io';

import '../Repository/Auth_Ropository_Contract.dart';

class AuthUploadUserImageUseCase {
  AuthRepository repository;
  AuthUploadUserImageUseCase(this.repository);

  Future<String> uploadUserImage({required File image , required String token})async {
    var response = await repository.uploadUserImage(token: token , image: image);
    return response;
  }

}