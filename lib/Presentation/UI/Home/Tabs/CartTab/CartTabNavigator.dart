import 'package:ecommerce/Core/Base/BaseNavigator.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';

abstract class CartTabNavigator extends BaseNavigator{
  void goToPaymentScreen(List<OrderProducts> orderProducts);
}