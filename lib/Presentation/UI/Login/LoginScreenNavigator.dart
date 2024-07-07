import 'package:ecommerce/Core/Base/BaseNavigator.dart';

abstract class LoginScreenNavigator extends BaseNavigator{
  goToCreateAccountScreen();
  goToHomeScreen();
  updateToken(String token);

}