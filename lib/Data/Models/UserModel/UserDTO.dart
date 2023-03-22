class UserDTO {
  UserDTO({
      this.name, 
      this.email, 
      this.passwordEncrypted, 
      this.phone, 
      this.birthDate, 
      this.userToken,});

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    passwordEncrypted = json['passwordEncrypted'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    userToken = json['userToken'];
  }
  String? name;
  String? email;
  String? passwordEncrypted;
  String? phone;
  String? birthDate;
  String? userToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['passwordEncrypted'] = passwordEncrypted;
    map['phone'] = phone;
    map['birthDate'] = birthDate;
    map['userToken'] = userToken;
    return map;
  }

}