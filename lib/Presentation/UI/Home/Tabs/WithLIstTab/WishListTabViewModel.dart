import 'package:ecommerce/Core/Base/Base_View_Model.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetWishListProductsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabNavigator.dart';
import 'package:flutter/material.dart';

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
      navigator!.showLoading("Loading...");
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      navigator!.hideDialog();
      navigator!.showSuccessMessage(response , (){navigator!.hideDialog();});
      getProducts();
    }else {
      navigator!.showLoading("Loading...");
      var response = await addToWishListUseCase.invoke(product);
      navigator!.hideDialog();
      navigator!.showSuccessMessage(response, (){navigator!.hideDialog();});
      getProducts();
    }

  }
}