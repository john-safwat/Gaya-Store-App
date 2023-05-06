import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:flutter/material.dart';

class ProfileTabViewModel extends ChangeNotifier {
  GetUserDataUseCase useCase ;
  ProfileTabViewModel(this.useCase);

  AppConfigProvider? provider;
  String? errorMessage ;
  UserData? userData ;

  void getData() async {
    errorMessage = null;
    userData = null;
    try {
      var response = await useCase.invoke(provider!.token);
      userData = response;
      notifyListeners();
    }catch (e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void  onTryAgainPress(){
    getData();
  }

}