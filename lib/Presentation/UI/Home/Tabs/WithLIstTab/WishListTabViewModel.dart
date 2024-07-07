import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetWishListProductsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabNavigator.dart';

class WishListTabViewModel extends BaseViewModel<WishListTabNavigator>{
  GetWishListProductsUseCase getWishListProductsUseCase ;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  AddToWishListUseCase addToWishListUseCase;
  WishListTabViewModel(this.getWishListProductsUseCase , this.deleteFromWishListUseCase , this.addToWishListUseCase);
  List<Product>? products ;
  String? errorMessage ;

  void getProducts() async{
    products = null;
    errorMessage = null;
    try{
      var response = await getWishListProductsUseCase.invoke();
      products = response;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){
    getProducts();
  }

  void onViewNowPress(Product product){
    navigator!.goToProductDetailsScreen(product);
  }

  void onSlidablePress(Product product)async{
    if(product.isInWishList!){
      navigator!.showLoading(message: "Loading...");
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response ,posActionTitle: "ok");
      getProducts();
    }else {
      navigator!.showLoading(message: "Loading...");
      var response = await addToWishListUseCase.invoke(product);
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response, posActionTitle: "ok");
      getProducts();
    }

  }
}