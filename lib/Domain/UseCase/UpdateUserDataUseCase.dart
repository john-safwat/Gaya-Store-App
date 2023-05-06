import 'package:ecommerce/Domain/Repository/User_Repository_Contract.dart';

class UpdateUserDataUseCase {
  UserRepository repository ;
  UpdateUserDataUseCase(this.repository);

  Future<String?> invoke (String? token , String? name , String? phone, String? birthDate , String? password )async{
    var response = await repository.updateUserData(token, name, phone, birthDate, password);
    return response;
  }
}