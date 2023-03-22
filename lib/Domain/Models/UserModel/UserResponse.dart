import '../../../Data/Models/UserDto.dart';

class UserResponse {
  UserResponse({
    this.statusCode,
    this.message,
    this.user,
  });

  String? statusCode;
  String? message;
  User? user;

}