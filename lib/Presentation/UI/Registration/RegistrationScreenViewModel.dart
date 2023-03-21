import 'package:flutter/widgets.dart';

class RegistrationScreenViewModel extends ChangeNotifier{
  String? nameValidation(String input){
    if (input.isEmpty){
      return "The Name Can't Be Empty";
    }else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(input)){
      return "Name Mustn't Contain Special Characters";
    }
    return null;
  }
  String? emailValidation(String input){return null;}
  String? passwordValidation(String input){return null;}
  String? rePasswordValidation(String input){return null;}
  String? phoneValidation(String input){return null;}
}