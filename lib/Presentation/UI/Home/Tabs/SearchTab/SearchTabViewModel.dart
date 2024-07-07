import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/SearchForProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/SearchTab/SearchTabNavigator.dart';

class SearchTabViewModel extends BaseViewModel<SearchTabNavigator> {
  SearchForProductUseCase searchForProductUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  SearchTabViewModel(this.searchForProductUseCase , this.addToWishListUseCase , this.deleteFromWishListUseCase);

  String? errorMessage;
  List<Product>? products ;

  void getProducts(String query)async{
    errorMessage = null;
    products = null;
    try{
      var response = await searchForProductUseCase.invoke(query);
      products = response;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
    if(query.isEmpty){
      products = null;
      notifyListeners();
    }
  }

  void onViewNowPress(Product product){
    navigator!.goToDetailsScreen(product);
  }


  void onSlidablePress(Product product)async{
    if(product.isInWishList!){
      navigator!.showLoading(message: "Loading...");
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response ,posActionTitle: "ok");
      notifyListeners();
    }else {
      navigator!.showLoading(message: "Loading...");
      var response = await addToWishListUseCase.invoke(product);
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response, posActionTitle: "ok");
      notifyListeners();
    }

  }

}