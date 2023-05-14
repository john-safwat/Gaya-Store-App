import 'package:ecommerce/Core/Base/Base_Navigator.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class ProductsListNavigator extends BaseNavigator{
  void goToProductDetailsScreen(Product product);
}