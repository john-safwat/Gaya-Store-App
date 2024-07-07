import 'package:ecommerce/Core/Base/BaseNavigator.dart';
import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class HomeTabNavigator extends BaseNavigator{
  void goToProductListScreen(Categories category);
  void goToProductDetailsScreen(Product product);
}