import 'package:ecommerce/Domain/Models/LoginResponse.dart';

class LoginResponseDTO {
  LoginResponseDTO({
      this.statusCode, 
      this.message, 
      this.token,});

  LoginResponseDTO.fromJson(dynamic json) {
    statusCode = json['status Code'];
    message = json['message'];
    token = json['token'];
  }
  String? statusCode;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status Code'] = statusCode;
    map['message'] = message;
    map['token'] = token;
    return map;
  }


  LoginResponse toDomain(){
    return LoginResponse(
      message: message,
      statusCode: statusCode,
      token: token
    );
  }
}