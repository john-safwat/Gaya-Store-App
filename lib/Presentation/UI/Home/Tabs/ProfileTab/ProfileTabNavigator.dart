import 'package:ecommerce/Core/Base/Base_Navigator.dart';

abstract class ProfileTabNavigator extends BaseNavigator{
  void goToOrderHistory();
  void goToEditUserInfo();
  void goToLoginScreen();
  void showDialog(String message , Function onConfirmationPress);
}