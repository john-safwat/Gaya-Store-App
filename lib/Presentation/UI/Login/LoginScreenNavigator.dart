import 'package:ecommerce/Core/Base/Base_Navigator.dart';

abstract class LoginScreenNavigator extends BaseNavigator{
  goToCreateAccountScreen();
  goToHomeScreen();
  updateToken(String token);

}