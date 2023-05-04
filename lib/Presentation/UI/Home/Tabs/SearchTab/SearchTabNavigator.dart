import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class SearchTabNavigator{
  void goToDetailsScreen(Product product);
  void showLoading();
  void hideDialog();
  void showSuccessMessage(String message);
}