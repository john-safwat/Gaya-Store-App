abstract class RegistrationScreenNavigator{
  showErrorMessage(String message);
  showSuccessMessage(String message , Function action);
  showLoading(String message);
  hideDialog();
  goToPickImageScreen();
  updateToken(String token);
}