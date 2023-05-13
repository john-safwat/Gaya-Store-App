import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/UseCase/AuthRegistrationUseCase.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenNavigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationScreenViewModel extends ChangeNotifier {
  RegistrationScreenNavigator? navigator ;
  AuthRegistrationUseCase useCase;
  RegistrationScreenViewModel(this.useCase);
  AppConfigProvider? provider ;


  DateTime date = DateTime.now();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


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
  void register()async {
    if (passwordController.text != rePasswordController.text){
      navigator!.showErrorMessage("Not The Same Password");
      return;
    }
    String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    try{
      navigator!.showLoading("Creating Your Account");
      var response = await useCase.invoke(name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                          dateTime: datetime);
      navigator!.hideDialog();
      if (response.statusCode == "409"){
        navigator!.showErrorMessage(response.message!);
      }else if (response.statusCode == "400") {
        navigator!.showErrorMessage(response.message!);
      }else {
        navigator!.updateToken(response.token!);
        navigator!.showSuccessMessage(response.message!, goToHome);
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

  void goToHome(){
    navigator!.hideDialog();
    navigator!.goToPickImageScreen();
  }

}
