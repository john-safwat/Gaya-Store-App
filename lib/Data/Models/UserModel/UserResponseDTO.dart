import 'UserDTO.dart';

class UserResponseDTO {
  UserResponseDTO({
    this.statusCode,
    this.message,
    this.user,
  });

  UserResponseDTO.fromJson(dynamic json) {
    statusCode = json['Status_Code'];
    message = json['message'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
  }
  String? statusCode;
  String? message;
  UserDTO? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status_Code'] = statusCode;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
