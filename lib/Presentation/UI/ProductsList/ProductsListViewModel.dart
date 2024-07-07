import 'dart:io';

import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductsByCategoryIdUseCase.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListNavigator.dart';
class ProductsListViewModel extends BaseViewModel<ProductsListNavigator> {
  GetProductsByCategoryIdUseCase getProductsByCategoryIdUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  ProductsListViewModel(this.getProductsByCategoryIdUseCase,
      this.addToWishListUseCase, this.deleteFromWishListUseCase);

  String? errorMessage;
  List<Product>? products;
  double categoryId = 0;

  void getProductsByCategoryId(double categoryId) async {
    errorMessage = null;
    products = null;
    this.categoryId = categoryId;
    try {
      var response = await getProductsByCategoryIdUseCase.invoke(categoryId);
      products = response;
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
      navigator!.showLoading(message: "Loading .... ");
      var response = await addToWishListUseCase.invoke(product);
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response , posActionTitle: "ok");
    }else {
      navigator!.showLoading(message: "Loading .... ");
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response , posActionTitle: "ok");
    }
  }
}
