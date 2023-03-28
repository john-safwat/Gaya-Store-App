abstract class LoginScreenNavigator {
  goToCreateAccountScreen();
  goToHomeScreen();
  showErrorMessage(String message);
  showSuccessMessage(String message , Function action);
  showLoading(String message);
  updateToken(String token);
  hideDialog();
}