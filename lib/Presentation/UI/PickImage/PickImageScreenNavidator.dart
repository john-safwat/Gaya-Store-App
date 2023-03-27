abstract class PickImageScreenNavigator {
  showErrorMessage(String message);
  showSuccessMessage(String message , Function action);
  showLoading(String message);
  goToHomeScreen();
  hideDialog();
}