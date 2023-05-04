import 'package:ecommerce/Domain/Models/Categories/CategoriesResponse.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}


abstract class CategoriesRepository {
  Future<CategoriesResponse> getCategories();
}