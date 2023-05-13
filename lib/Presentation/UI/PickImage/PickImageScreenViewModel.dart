import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Domain/UseCase/AuthUploadUserImageUseCase.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenNavidator.dart';
import 'package:flutter/material.dart';

class PickImageScreenViewModel extends ChangeNotifier{
  AuthUploadUserImageUseCase useCase ;
  PickImageScreenViewModel(this.useCase);
  PickImageScreenNavigator? navigator ;
  AppConfigProvider? provider ;

  void uploadImage (File? image)async{
    if (image != null){
      try{
        navigator!.showLoading("Uploading Your Image");
        var response =await useCase.uploadUserImage(image: image, token: provider!.token);
        if(response=='Image Uploaded'){
          navigator!.hideDialog();
          navigator!.showSuccessMessage("Image Uploaded Successfully",goToHomeScreen);
        }else{
          navigator!.hideDialog();
          navigator!.showErrorMessage("Can't Upload the Image");
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
    } else{
      navigator!.showSuccessMessage("No Image ... No Problem \nYou Can Update It any Time",goToHomeScreen);
    }
  }

  void goToHomeScreen(){
    navigator!.hideDialog();
    navigator!.goToHomeScreen();
  }
}