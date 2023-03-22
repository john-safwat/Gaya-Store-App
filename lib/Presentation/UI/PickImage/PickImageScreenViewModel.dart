import 'dart:io';

import 'package:ecommerce/Domain/UseCase/AuthUploadUserImageUseCase.dart';
import 'package:flutter/material.dart';

class PickImageScreenViewModel extends ChangeNotifier{
  AuthUploadUserImageUseCase useCase ;
  PickImageScreenViewModel(this.useCase);

  void uploadImage (File? image , String token)async{
    if (image != null){
      try{
        var response =await useCase.uploadUserImage(image: image, token: token);
        debugPrint(response);
      } catch(e) {
        debugPrint(e.toString());
      }
    } else{

    }
  }
}