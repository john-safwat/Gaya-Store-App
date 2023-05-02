import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/SearchForProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/SearchTab/SearchTabNavigator.dart';
import 'package:flutter/material.dart';

class SearchTabViewModel extends ChangeNotifier {
  SearchForProductUseCase useCase ;
  SearchTabViewModel(this.useCase);

  String? errorMessage;
  List<Product>? products ;
  SearchTabNavigator? navigator;

  void getProducts(String query)async{
    errorMessage = null;
    products = null;
    try{
      var response = await useCase.invoke(query);
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

  void onDeletePress(Product product){

  }

}