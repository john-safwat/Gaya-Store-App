import 'Categories.dart';

class CategoriesResponse {
  CategoriesResponse({
    this.statusCode,
    this.message,
    this.categories,});

  String? statusCode;
  String? message;
  List<Categories>? categories;

}