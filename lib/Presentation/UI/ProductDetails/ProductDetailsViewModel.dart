import 'dart:io';

import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/ProductDetails.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier{
  GetProductDetailsUseCase useCase ;
  ProductDetailsViewModel(this.useCase);

  ProductDetails? product ;
  String? errorMessage;
  AppConfigProvider? provider;
  String? id;

  void getProductDetails(String id ,AppConfigProvider provider)async{
    this.id =id;
    this.provider= provider;
    try{
      var response = await useCase.invoke(id , provider.token);
      product = response;
      notifyListeners();
    }on IOException catch(e){
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress(){
    getProductDetails(id!, provider!);
  }
}