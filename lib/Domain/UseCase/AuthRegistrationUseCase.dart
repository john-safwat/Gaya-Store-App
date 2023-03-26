import 'package:ecommerce/Domain/Models/CreateUserResponse.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropsitory_Contract.dart';

class AuthRegistrationUseCase {
  AuthRepository repository;
  AuthRegistrationUseCase(this.repository);

  Future<CreateUserResponse> invoke({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  }) async{

    var response = await repository.addNewUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        dateTime: dateTime
    );
    return response!;
  }
}
