import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/UseCase/AuthLoginUserCase.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenNavigator.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends BaseViewModel<LoginScreenNavigator> {
  AuthLoginUserCase useCase;

  LoginScreenViewModel({required this.useCase});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

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
  void onLoginButtonPress() async {
    if (formKey.currentState!.validate()) {
      navigator!.showLoading(message: "Logging You In");
      try {
        var response = await useCase.login(
            email: emailController.text, password: passwordController.text);
        if (response.statusCode == '200') {
          navigator!.goBack();
          navigator!.updateToken(response.token!);
          navigator!.showSuccessMessage(
              message: response.message!,
              posAction: goToHome,
              posActionTitle: "ok");
        } else {
          navigator!.goBack();
          navigator!.showFailMessage(
              message: response.message!, posActionTitle: "ok");
        }
      } on IOException {
        navigator!.goBack();
        navigator!.showFailMessage(
            message: "Check Your Internet", posActionTitle: "ok");
      } on TimeoutException catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(
            message: "Request Timed Out", posActionTitle: "ok");
      } catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(message: e.toString(), posActionTitle: "ok");
      }
    }
  }

  // code on create Account press
  void onCreateAccountButtonPress() {
    navigator!.goToCreateAccountScreen();
  }

  changeVisibilityState() {
    isVisible = !isVisible;
    notifyListeners();
  }

  // code go to home screen
  void goToHome() {
    navigator!.goToHomeScreen();
  }
}
