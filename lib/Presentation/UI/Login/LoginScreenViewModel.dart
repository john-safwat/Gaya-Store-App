import 'dart:async';
import 'dart:io';
import 'package:ecommerce/Core/Base/Base_View_Model.dart';
import 'package:ecommerce/Domain/UseCase/AuthLoginUserCase.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenNavigator.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends BaseViewModel<LoginScreenNavigator> {
  AuthLoginUserCase useCase ;
  LoginScreenViewModel({required this.useCase});
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

  // code on login press
  void onLoginButtonPress(String email , String password) async {
    navigator!.showLoading("Logging You In");
    try{
      var response = await useCase.login(email: email, password: password);
      if (response.statusCode == '200'){
        navigator!.hideDialog();
        navigator!.updateToken(response.token!);
        navigator!.showSuccessMessage(response.message!, goToHome);
      }else{
        navigator!.hideDialog();
        navigator!.showErrorMessage(response.message!);
      }
    }on IOException{
      navigator!.hideDialog();
      navigator!.showErrorMessage("Check Your Internet");
    } on TimeoutException catch (e){
      navigator!.hideDialog();
      navigator!.showErrorMessage("Request Timed Out");
    }catch (e){
      navigator!.hideDialog();
      navigator!.showErrorMessage(e.toString());
    }
  }
  // code on create Account press
  void onCreateAccountButtonPress(){
    navigator!.goToCreateAccountScreen();
  }

  // code go to home screen
  void goToHome(){
    navigator!.hideDialog();
    navigator!.goToHomeScreen();
  }
}
