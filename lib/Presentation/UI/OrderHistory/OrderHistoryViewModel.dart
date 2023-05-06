import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:ecommerce/Domain/UseCase/GetOrdersHistoryUseCase.dart';
import 'package:flutter/material.dart';

class OrderHistoryViewModel extends ChangeNotifier {
  GetOrdersHistoryUseCase useCase ;
  OrderHistoryViewModel(this.useCase);

  List<OrdersHistory>? orders;
  String? errorMessage ;

  AppConfigProvider? provider;

  void getData()async{
    try{
      var response = await useCase.invoke(provider!.token);
      orders = response;
      notifyListeners();
    }catch (e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){
    getData();
  }

}