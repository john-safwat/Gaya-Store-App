import 'package:ecommerce/Domain/Models/CategoriesResponse.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}


abstract class CategoriesRepository {
  Future<CategoriesResponse> getCategories();
}