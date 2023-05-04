class UserDTO {
  UserDTO({
      this.name, 
      this.email, 
      this.password, 
      this.phone, 
      this.birthDate, 
      this.token,});

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    token = json['token'];
  }
  String? name;
  String? email;
  String? password;
  String? phone;
  String? birthDate;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['birthDate'] = birthDate;
    map['token'] = token;
    return map;
  }

}