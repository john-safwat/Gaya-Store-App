import 'package:flutter/cupertino.dart';

abstract class RegistrationScreenNavigator{
  showErrorMessage(String message);
  showSuccessMessage(String message);
  showLoading(String message);
  goTOHomeScreen();
  hideDialog();
}