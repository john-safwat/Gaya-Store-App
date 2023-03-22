import 'package:ecommerce/Domain/Models/UserModel/UserResponse.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropsitory_Contract.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserResponse?> addNewUser(
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

    return response;
  }
}
