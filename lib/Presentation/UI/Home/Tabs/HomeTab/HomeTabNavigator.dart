import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';

abstract class HomeTabNavigator {
  void goToProductListScreen(Categories category);
  void goToProductDetailsScreen(Product product);
}