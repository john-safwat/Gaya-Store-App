import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class DeleteWishListUseCase{
  ProductRepository repository ;
  DeleteWishListUseCase(this.repository);

  Future<String> invoke()async{
    var response = await repository.deleteWishList();
    return response;
  }
}