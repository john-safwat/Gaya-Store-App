abstract class ProfileTabNavigator {
  void goToOrderHistory();
  void goToEditUserInfo();
  void showLoading(String message);
  void hideDialog();
  void goToLoginScreen();
  void showDialog(String message , Function onConfirmationPress);
}