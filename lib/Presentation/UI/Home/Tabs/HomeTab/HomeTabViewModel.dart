import 'dart:io';

import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetNewAddedProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabNavigator.dart';
import 'package:flutter/cupertino.dart';

class HomeTabViewModel extends ChangeNotifier {
  GetCategoriesUseCase categoriesUseCase ;
  GetNewAddedProductsUseCase  newAddedProductsUseCase ;
  HomeTabNavigator? navigator;
  String? errorMessage ;
  HomeTabViewModel(this.categoriesUseCase , this.newAddedProductsUseCase);
  List<Categories>? categories;
  List<Product>? products;

  void getCategories() async{
    errorMessage = null;
    categories = null;
    try{
      var response = await categoriesUseCase.invoke();
      categories = response.categories;
      notifyListeners();
    }on IOException catch(e){
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void getNewAddedProducts() async{
    errorMessage = null;
    products = null;
    try{
      var response = await newAddedProductsUseCase.invoke();
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
    getCategories();
    getNewAddedProducts();
  }

  void goToProductsListScreen(Categories category){
    navigator!.goToProductListScreen(category);
  }

}