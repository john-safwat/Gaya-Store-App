import 'package:ecommerce/Domain/Models/Prdouct.dart';

abstract class WishListTabNavigator {
  void goToProductDetailsScreen(Product product);
  void showLoading();
  void hideDialog();
  void showSuccessMessage(String message);
}