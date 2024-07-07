import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/UseCase/UpdateUserDataUseCase.dart';
import 'package:ecommerce/Presentation/UI/EditUserInfo/EditUserInfoNavigator.dart';
import 'package:flutter/material.dart';

class EditUserInfoViewModel extends BaseViewModel<EditUserInfoNavigator> {
  UserData? userData;
  UpdateUserDataUseCase useCase ;
  EditUserInfoViewModel(this.useCase);
  DateTime date = DateTime.now();
  AppConfigProvider? provider ;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void updateControllers(){
    nameController.text = userData!.name!;
    emailController.text = userData!.email!;
    phoneController.text = userData!.phone!;
    date = DateTime.parse(userData!.birthDate!);
  }

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
      return null;
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

  void onUpdateButtonPress() async {
    navigator!.showLoading(message: "Loading ...");
    if(passwordController.text.isNotEmpty){
      if(passwordController.text != rePasswordController.text){
        navigator!.goBack();
        navigator!.showFailMessage(message:"Password and Password Confirmation aren't the same" , posActionTitle: "ok");
      }else {
        try {
          var response = await useCase.invoke(provider!.token, nameController.text, phoneController.text, date.toString(), passwordController.text);
          navigator!.goBack();
          navigator!.showSuccessMessage(message :response ??"Non",posActionTitle: "ok");
        }catch (e){
          navigator!.goBack();
          navigator!.showFailMessage(message: e.toString() , posActionTitle: "ok");
        }
      }
    }else{
      try {
        var response = await useCase.invoke(provider!.token, nameController.text, phoneController.text, date.toString(), null);
        navigator!.goBack();
        navigator!.showSuccessMessage(message: response!,posActionTitle: "ok");
      }catch (e){
        navigator!.goBack();
        navigator!.showFailMessage(message :e.toString() , posActionTitle: "Ok");
      }
    }
  }



}