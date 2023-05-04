import 'package:ecommerce/Domain/Repository/Categories_Repository_Contract.dart';

import '../Models/Categories/CategoriesResponse.dart';

class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository ;
  GetCategoriesUseCase(this.categoriesRepository);

  Future<CategoriesResponse> invoke() async{
    var response  = await categoriesRepository.getCategories();
    return response;
  }
}