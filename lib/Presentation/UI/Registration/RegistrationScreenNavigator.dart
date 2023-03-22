import 'package:flutter/cupertino.dart';

abstract class RegistrationScreenNavigator{
  showErrorMessage(String message);
  showSuccessMessage(String message , Function action);
  showLoading(String message);
  goToPickImageScreen();
  updateToken(String token);
  hideDialog();
}