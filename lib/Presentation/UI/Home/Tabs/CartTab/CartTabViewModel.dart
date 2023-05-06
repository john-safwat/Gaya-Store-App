import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/Cart/CartProducts.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/UseCase/DeleteProductFromCartUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetCartItemsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabNavigator.dart';
import 'package:flutter/material.dart';

class CartTabViewModel extends ChangeNotifier{
  GetCartItemsUseCase getCartItemsUseCase;
  DeleteProductFromCartUseCase deleteProductFormCartUseCase;
  CartTabViewModel(this.getCartItemsUseCase , this.deleteProductFormCartUseCase);

  CartTabNavigator? navigator;

  String? errorMessage;
  List<CartProducts>? products ;
  AppConfigProvider? provider;

  void getCartItems()async{
    errorMessage =  null ;
    products = null;
    try{
      var response = await getCartItemsUseCase.invoke(provider!.token);
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

  double calcTotal(){
    double total = 0 ;
    for(int i = 0 ;i <products!.length;i++){
      total += (products![i].cartProduct!.orderedQuantity! * double.parse(products![i].cartProduct!.price!.toString() ) );
    }
    return total;
  }

  void onSlidablePress(String productId) async{
    navigator!.showLoading();
    var response = await deleteProductFormCartUseCase.invoke(productId, provider!.token);
    navigator!.hideDialog();
    navigator!.showSuccessMessage(response!);
    getCartItems();
  }

  void onGoToPaymentPress(){
    List<OrderProducts> orderProducts = [];
    for(int i =0 ; i< products!.length; i++){
      orderProducts.add(OrderProducts(
        id: int.parse(products![i].cartProduct!.id!.toString()),
        quantity: products![i].cartProduct!.orderedQuantity,
        orderTotal: (products![i].cartProduct!.orderedQuantity! * double.parse(products![i].cartProduct!.price!.toString())),
      ));
    }
    navigator!.goToPaymentScreen(orderProducts);
  }
}