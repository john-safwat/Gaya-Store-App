import 'package:ecommerce/Domain/Models/ProductsResponse.dart';
import 'package:ecommerce/Domain/Repository/Products_Prepository_Contract.dart';

class GetProductsByCategoryIdUseCase {
  ProductRepository repository ;
  GetProductsByCategoryIdUseCase(this.repository);
  Future<ProductsResponse> invoke(double categoryId) async{
    var response = await repository.getProductsByCategory(categoryId);
    var wishList = await repository.readData();
    if (wishList != null) {
      for(int i = 0 ; i < response.products!.length ; i++){
        for(int j = 0 ; j< wishList.length ; j++){
          if(response.products![i].id == wishList[j].id){
            response.products![i].isInWishList = true;
          }
        }
      }
    }
    return response;
  }
}