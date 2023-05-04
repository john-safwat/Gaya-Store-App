import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';

abstract class CartTabNavigator{
  void showLoading();
  void hideDialog();
  void showSuccessMessage(String message);
  void goToPaymentScreen(List<OrderProducts> orderProducts);
}