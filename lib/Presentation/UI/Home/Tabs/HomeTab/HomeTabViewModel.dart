import 'dart:io';

import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Data/SQL/SQLDB.dart';
import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetNewAddedProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabNavigator.dart';

class HomeTabViewModel extends BaseViewModel<HomeTabNavigator> {
  GetCategoriesUseCase categoriesUseCase;
  GetNewAddedProductsUseCase newAddedProductsUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  String? errorMessage;

  HomeTabViewModel(this.categoriesUseCase, this.newAddedProductsUseCase,
      this.addToWishListUseCase, this.deleteFromWishListUseCase);

  List<Categories>? categories;
  List<Product>? products;

  SQLdb sqLdb = SQLdb();

  void getCategories() async {
    errorMessage = null;
    categories = null;
    sqLdb.getDB();
    try {
      var response = await categoriesUseCase.invoke();
      categories = response.categories;
      notifyListeners();
    } on IOException catch (e) {
      errorMessage = "Check Your Internet Connection";
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void getNewAddedProducts() async {
    errorMessage = null;
    products = null;
    try {
      var response = await newAddedProductsUseCase.invoke();
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
    getCategories();
    getNewAddedProducts();
  }

  void goToProductsListScreen(Categories category) {
    navigator!.goToProductListScreen(category);
  }

  void onWidgetPress(Product product) {
    navigator!.goToProductDetailsScreen(product);
  }

  void onFavoritePress(Product product) async {
    if (!product.isInWishList!) {
      navigator!.showLoading(message: "Loading...");
      var response = await addToWishListUseCase.invoke(product);
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response  , posActionTitle: "ok");
    }else {
      navigator!.showLoading(message: "Loading...");
      var response = await deleteFromWishListUseCase.invoke(int.parse(product.id!.toString()));
      navigator!.goBack();
      navigator!.showSuccessMessage(message: response , posActionTitle: "ok");
    }
  }
}
