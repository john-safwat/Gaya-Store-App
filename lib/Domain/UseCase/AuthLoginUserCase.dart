import 'package:ecommerce/Domain/Models/User/LoginResponse.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropository_Contract.dart';
class AuthLoginUserCase {
  AuthRepository repository ;
  AuthLoginUserCase({required this.repository});

  Future<LoginResponse> login({required String email , required String password})async{
    var response =  await repository.login(email: email, password: password);
    return response;
  }
}