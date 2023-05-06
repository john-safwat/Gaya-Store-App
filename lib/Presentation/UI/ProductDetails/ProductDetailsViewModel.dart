import 'dart:io';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/Models/Products/ProductDetails.dart';
import 'package:ecommerce/Domain/UseCase/AddProductToCartUseCase.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsNavigator.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  GetProductDetailsUseCase getProductDetailsUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  AddProductToCartUseCase addProductTOCartUseCase;
  ProductDetailsViewModel(this.getProductDetailsUseCase,
      this.addToWishListUseCase, this.deleteFromWishListUseCase, this.addProductTOCartUseCase);

  ProductDetails? product;
  String? errorMessage;
  AppConfigProvider? provider;
  String? id;
  Product? abstractProduct;
  String image = '';
  ProductDetailsNavigator? navigator;

  void getProductDetails() async {
    try {
      var response = await getProductDetailsUseCase.invoke(id!, provider!.token);
      product = response;
      image = product!.images![0];
      notifyListeners();
    } on IOException catch (e) {
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress() {
    getProductDetails();
  }

  void onImagePress(int index) {
    image = product!.images![index];
    notifyListeners();
  }

  void onAddToCartPress(String token) async{
    navigator!.showLoading();
    var response = await addProductTOCartUseCase.invoke(product!.id!.toString(), token);
    navigator!.hideDialog();
    navigator!.showSuccessMessage(response ?? "data not found");
  }

}
