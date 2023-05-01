import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetWishListProductsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabNavigator.dart';
import 'package:flutter/material.dart';

class WishListTabViewModel extends ChangeNotifier{
  GetWishListProductsUseCase useCase ;
  WishListTabViewModel(this.useCase);
  WishListTabNavigator? navigator;
  List<Product>? products ;
  String? errorMessage ;

  void getProducts() async{
    products = null;
    errorMessage = null;
    try{
      var response = await useCase.invoke();
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
}