import 'dart:io';

import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/Models/ProductDetails.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  GetProductDetailsUseCase getProductDetailsUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  ProductDetailsViewModel(this.getProductDetailsUseCase,
      this.addToWishListUseCase, this.deleteFromWishListUseCase);

  ProductDetails? product;
  String? errorMessage;
  AppConfigProvider? provider;
  String? id;
  Product? abstractProduct;
  String image = '';

  void getProductDetails(String id, AppConfigProvider provider , Product abstractProduct) async {
    this.id = id;
    this.provider = provider;
    this.abstractProduct = abstractProduct;
    try {
      var response = await getProductDetailsUseCase.invoke(id, provider.token);
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
    getProductDetails(id!, provider!, abstractProduct!);
  }

  void onImagePress(int index) {
    image = product!.images![index];
    notifyListeners();
  }

  void onFavoritePress() async{
    if (!abstractProduct!.isInWishList!) {
      var response = await addToWishListUseCase.invoke(abstractProduct!);
      print(response);
    }else {
      var response = await deleteFromWishListUseCase.invoke(int.parse(abstractProduct!.id!.toString()));
      print(response);
    }
  }
}
