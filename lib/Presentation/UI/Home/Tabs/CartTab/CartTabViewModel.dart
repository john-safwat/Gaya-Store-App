import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/CartProduct.dart';
import 'package:ecommerce/Domain/Models/CartProducts.dart';
import 'package:ecommerce/Domain/UseCase/GetCartItemsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabNavigator.dart';
import 'package:flutter/material.dart';

class CartTabViewModel extends ChangeNotifier{
  GetCartItemsUseCase useCase ;
  CartTabViewModel(this.useCase);

  CartTabNavigator? navigator;

  String? errorMessage;
  List<CartProducts>? products ;
  AppConfigProvider? provider;

  void getCartItems(AppConfigProvider provider)async{
    errorMessage =  null ;
    products = null;
    this.provider = provider;
    try{
      var response = await useCase.invoke(provider.token);
      products = response;
      notifyListeners();
    }catch (e){
      errorMessage =  e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){

  }

  int onPlusButtonPress(int quantity , int orderQuantityCount){
    if (orderQuantityCount < quantity){
      orderQuantityCount++;
    }
    notifyListeners();
    return orderQuantityCount;
  }
  int onMinusButtonPress(int orderQuantityCount){
    if (orderQuantityCount >1){
      orderQuantityCount--;
    }
    notifyListeners();
    return orderQuantityCount;
  }

  double calcTotla(){
    double total = 0 ;
    for(int i = 0 ;i <products!.length;i++){
      total += (products![i].cartProduct!.orderedQuantity! * double.parse(products![i].cartProduct!.price!.toString() ) );
    }
    return total;
  }

  void onSlidablePress(CartProduct product){

  }
}