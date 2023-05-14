import 'package:ecommerce/Core/Base/Base_Navigator.dart';
import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class HomeTabNavigator extends BaseNavigator{
  void goToProductListScreen(Categories category);
  void goToProductDetailsScreen(Product product);
}