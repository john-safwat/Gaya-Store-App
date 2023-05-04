import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class WishListTabNavigator {
  void goToProductDetailsScreen(Product product);
  void showLoading();
  void hideDialog();
  void showSuccessMessage(String message);
}