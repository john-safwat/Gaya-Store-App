import 'package:ecommerce/Core/Base/BaseNavigator.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class ProductsListNavigator extends BaseNavigator{
  void goToProductDetailsScreen(Product product);
}