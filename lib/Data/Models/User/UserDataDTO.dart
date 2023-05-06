import '../../../Domain/Models/User/UserData.dart';

class UserDataDTO {
  UserDataDTO({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.birthDate, 
      this.token, 
      this.createdAt, 
      this.updatedAt,});

  UserDataDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    birthDate = json['birthDate'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? birthDate;
  String? token;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['birthDate'] = birthDate;
    map['token'] = token;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

  UserData toDomain(){
    return UserData(
      name: name,
      token: token,
      id: id,
      image: image,
      birthDate: birthDate,
      createdAt: createdAt,
      email: email,
      phone: phone,
      updatedAt: updatedAt
    );
  }

}