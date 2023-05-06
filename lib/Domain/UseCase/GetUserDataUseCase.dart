import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class GetUserDataUseCase {
  UserRepository repository ;
  GetUserDataUseCase(this.repository);

  Future<UserData> invoke(String token) async {
    var response = await repository.getUserData(token);
    return response;
  }
}