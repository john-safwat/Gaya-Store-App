import 'package:ecommerce/Domain/Models/UserModel/UserResponse.dart';

abstract class Auth_Remote_Data_Source {
  UserResponse? addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });
}

abstract class Auth_Repository {
  String? addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  });
}
