import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class SearchForProductUseCase {
  ProductRepository repository ;
  SearchForProductUseCase(this.repository);

  Future<List<Product>?> invoke(String query)async{
    var response = await repository.search(query);
    var wishList = await repository.readData();
    if (wishList != null) {
      for(int i = 0 ; i < response!.length ; i++){
        for(int j = 0 ; j< wishList.length ; j++){
          if(response[i].id == wishList[j].id){
            response[i].isInWishList = true;
          }
        }
      }
    }
    return response;
  }
}