import 'package:ecommerce/Domain/Models/User/CreateUserResponse.dart';

import 'UserDTO.dart';

class CreateUserResponseDTO {
  CreateUserResponseDTO({
      this.statusCode, 
      this.message, 
      this.user,});

  CreateUserResponseDTO.fromJson(dynamic json) {
    statusCode = json['status_code'];
    message = json['message'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
  }
  String? statusCode;
  String? message;
  UserDTO? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  CreateUserResponse toDomain(){
    return CreateUserResponse(
      message: message,
      statusCode: statusCode,
      token: user?.token??""
    );
  }

}