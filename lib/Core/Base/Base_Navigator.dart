abstract class BaseNavigator {
  showErrorMessage(String message);
  showSuccessMessage(String message , Function action);
  showLoading(String message);
  hideDialog();
}