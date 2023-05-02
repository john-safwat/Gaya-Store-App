import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

import '../Models/Prdouct.dart';

class SearchForProductUseCase {
  ProductRepository repository ;
  SearchForProductUseCase(this.repository);

  Future<List<Product>?> invoke(String query)async{
    var response = await repository.search(query);
    return response.products;
  }
}