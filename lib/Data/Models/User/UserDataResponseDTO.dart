import 'UserDataDTO.dart';

class UserDataResponseDTO {
  UserDataResponseDTO({
      this.statusCode, 
      this.message, 
      this.user,});

  UserDataResponseDTO.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    user = json['user'] != null ? UserDataDTO.fromJson(json['user']) : null;
  }
  int? statusCode;
  String? message;
  UserDataDTO? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }



}