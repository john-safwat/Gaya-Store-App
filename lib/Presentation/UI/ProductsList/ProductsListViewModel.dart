import 'dart:io';

import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductsByCategoryIdUseCase.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListNavigator.dart';
import 'package:flutter/material.dart';

class ProductsListViewModel extends ChangeNotifier {
  GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  ProductsListViewModel(this.getProductsByCategoryIdUseCase,
      this.addToWishListUseCase, this.deleteFromWishListUseCase);
  ProductsListNavigator? navigator;

  String? errorMessage;
  List<Product>? products;
  double categoryId = 0;

  void getProductsByCategoryId(double categoryId) async {
    errorMessage = null;
    products = null;
    this.categoryId = categoryId;
    try {
      var response = await getProductsByCategoryIdUseCase.invoke(categoryId);
      products = response.products;
      notifyListeners();
    } on IOException catch (e) {
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainButtonPress() {
    getProductsByCategoryId(categoryId);
  }

  void onWidgetPress(Product product) {
    navigator!.goToProductDetailsScreen(product);
  }

  void onFavoritePress(Product product) async {
    if (!product.isInWishList!) {
      var response = await addToWishListUseCase.invoke(product);
      print(response);
    }else {
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      print(response);
    }
  }
}
