import 'UserData.dart';

class UserDataResponse {
  UserDataResponse({
      this.statusCode, 
      this.message, 
      this.user,});


  int? statusCode;
  String? message;
  UserData? user;

}