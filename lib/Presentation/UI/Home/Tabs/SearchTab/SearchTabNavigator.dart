import 'package:ecommerce/Core/Base/Base_Navigator.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';

abstract class SearchTabNavigator extends BaseNavigator{
  void goToDetailsScreen(Product product);
}