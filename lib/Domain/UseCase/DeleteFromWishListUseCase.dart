import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class DeleteFromWishListUseCase {
  ProductRepository repository;
  DeleteFromWishListUseCase(this.repository);

  Future<String> invoke(int id) async{
    var response = await repository.deleteData(id);
    return response;
  }

}