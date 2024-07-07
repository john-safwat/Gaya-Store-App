import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/UseCase/AuthRegistrationUseCase.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenNavigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationScreenViewModel extends BaseViewModel<RegistrationScreenNavigator>{
  AuthRegistrationUseCase useCase;
  RegistrationScreenViewModel(this.useCase);


  DateTime date = DateTime.now();
  bool isVisible = false;
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
      navigator!.showFailMessage(message: "Not The Same Password" , posActionTitle: "Ok");
      return;
    }
    String datetime = DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    if(formKey.currentState!.validate()){
      try{
        navigator!.showLoading(message: "Creating Your Account");
        var response = await useCase.invoke(name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneController.text,
            dateTime: datetime);
        navigator!.goBack();
        if (response.statusCode == "409"){
          navigator!.showFailMessage(message: response.message! , posActionTitle: "ok");
        }else if (response.statusCode == "400") {
          navigator!.showFailMessage(message: response.message! , posActionTitle: "ok");
        }else {
          appConfigProvider!.updateToken(response.token??"");
          navigator!.showSuccessMessage(message:response.message!, posAction: goToHome , posActionTitle: "ok");
        }
      }on IOException{
        navigator!.goBack();
        navigator!.showFailMessage(message: "Check Your Internet" , posActionTitle: "ok");
      } on TimeoutException catch (e){
        navigator!.goBack();
        navigator!.showFailMessage(message: "Request Timed Out" , posActionTitle: "ok");

      }catch (e){
        navigator!.goBack();
        navigator!.showFailMessage(message: e.toString() , posActionTitle: "ok");
      }
    }
  }

  void goToHome(){
    navigator!.goBack();
    navigator!.goToPickImageScreen();
  }

  changeDate(DateTime? dateTime){
    if(dateTime != null){
      date = dateTime;
      notifyListeners();
    }
  }


  void changeVisibilityState() {
    isVisible = !isVisible;
    notifyListeners();
  }

}
