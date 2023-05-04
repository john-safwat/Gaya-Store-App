import 'package:ecommerce/Domain/Models/Categories/Categories.dart';

class CategoriesDTO {
  CategoriesDTO({
      this.id, 
      this.name, 
      this.image,});

  CategoriesDTO.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

  Categories toDomain(){
    return Categories(
      id: id,
      image: image,
      name: name
    );
  }

}