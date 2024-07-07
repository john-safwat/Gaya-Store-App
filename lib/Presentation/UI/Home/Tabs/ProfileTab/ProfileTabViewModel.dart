import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/UseCase/DeleteWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/ProfileTab/ProfileTabNavigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabViewModel extends BaseViewModel<ProfileTabNavigator> {
  GetUserDataUseCase useCase;

  DeleteWishListUseCase deleteWishListUseCase;

  ProfileTabViewModel(this.useCase, this.deleteWishListUseCase);

  AppConfigProvider? provider;
  String? errorMessage;

  UserData? userData;

  void getData() async {
    errorMessage = null;
    userData = null;
    try {
      var response = await useCase.invoke(provider!.token);
      userData = response;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void onTryAgainPress() {
    getData();
  }

  void onOrderHistoryPress() {
    navigator!.goToOrderHistory();
  }

  void onPersonalDetailsPress() {
    navigator!.goToEditUserInfo();
  }

  void onLogoutPress() {
    navigator!.showQuestionMessage(
        message: "Are You Sure",
        posAction: onConfirmationPress,
        posActionTitle: "ok",
        negativeActionTitle: "Cancel");
  }

  void onConfirmationPress() async {
    navigator!.showLoading(message: "Logging You Out");
    var response = await deleteWishListUseCase.invoke();
    final pref = await SharedPreferences.getInstance();
    await pref.setString("token", '');
    navigator!.goBack();
    navigator!.goToLoginScreen();
  }
}
