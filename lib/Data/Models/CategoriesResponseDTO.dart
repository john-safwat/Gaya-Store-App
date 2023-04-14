import 'package:ecommerce/Domain/Models/CategoriesResponse.dart';

import 'CategoriesDTO.dart';

class CategoriesResponseDTO {
  CategoriesResponseDTO({
      this.statusCode, 
      this.message, 
      this.categories,});

  CategoriesResponseDTO.fromJson(dynamic json) {
    statusCode = json['Status_Code'];
    message = json['Message'];
    if (json['Categories'] != null) {
      categories = [];
      json['Categories'].forEach((v) {
        categories?.add(CategoriesDTO.fromJson(v));
      });
    }
  }
  String? statusCode;
  String? message;
  List<CategoriesDTO>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status_Code'] = statusCode;
    map['Message'] = message;
    if (categories != null) {
      map['Categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CategoriesResponse toDomain(){
    return CategoriesResponse(
      message: message,
      statusCode: statusCode,
      categories: categories!.map((e) => e.toDomain()).toList()
    );
  }

}