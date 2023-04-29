import 'dart:io';

import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetProductsByCategoryIdUseCase.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListNavigator.dart';
import 'package:flutter/material.dart';

class ProductsListViewModel extends ChangeNotifier{
  GetProductsByCategoryIdUseCase useCase ;
  ProductsListViewModel(this.useCase);
  ProductsListNavigator? navigator;

  String? errorMessage ;
  List<Product>? products ;
  double categoryId = 0;

  void getProductsByCategoryId(double categoryId) async{
    errorMessage = null;
    products = null;
    this.categoryId = categoryId;
    try{
      var response = await useCase.invoke(categoryId);
      products = response.products;
      notifyListeners();
    }on IOException catch(e){
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainButtonPress(){
    getProductsByCategoryId(categoryId);
  }

  void onWidgetPress(Product product){
    navigator!.goToProductDetailsScreen(product);
  }
}