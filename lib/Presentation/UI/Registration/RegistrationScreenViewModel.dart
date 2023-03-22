import 'package:ecommerce/Data/Api/ApiManager.dart';
import 'package:ecommerce/Domain/Repository/Auth_Ropsitory_Contract.dart';
import 'package:ecommerce/Domain/UseCase/AuthRegistrationUseCase.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenNavigator.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class RegistrationScreenViewModel extends ChangeNotifier {
  RegistrationScreenNavigator? navigator ;
  AuthRegistrationUseCase useCase;
  RegistrationScreenViewModel(this.useCase);
  // validate if the name don't contain any special character
  String? nameValidation(String input) {
    if (input.isEmpty) {
      return "The Name Can't Be Empty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(input)) {
      return "Name Mustn't Contain Special Characters";
    }
    return null;
  }

  // validate on the email form
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "The Email Can't Be Empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "The Password Can't Be Empty";
    } else if (input.length < 8) {
      return "The Password Must be More Than 8 Characters";
    }
    return null;
  }

  // validate on phone number
  String? phoneValidation(String input) {
    if (input.isEmpty) {
      return "Please Enter a Phone Number";
    } else if (!RegExp(
            r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
        .hasMatch(input)) {
      return "Please Enter a Valid Phone Number";
    }
    return null;
  }

  // signup method
  void register(
      {required String name,
      required String email,
      required String password,
      required String rePassword,
      required String phone,
      required DateTime date})async {
    if (password != rePassword){
      navigator!.showErrorMessage("Not The Same Password");
    }
    String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    var response =await useCase.invoke(name: name, email: email, password: password, phone: phone, dateTime: datetime);
    print(response.message);
  }
}
