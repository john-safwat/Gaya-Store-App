import 'dart:async';
import 'dart:io';

import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/UseCase/AuthUploadUserImageUseCase.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenNavidator.dart';

class PickImageScreenViewModel extends BaseViewModel<PickImageScreenNavigator> {
  AuthUploadUserImageUseCase useCase;

  PickImageScreenViewModel(this.useCase);

  void uploadImage(File? image) async {
    if (image != null) {
      try {
        navigator!.showLoading(message: "Uploading Your Image");
        var response = await useCase.uploadUserImage(
            image: image, token: appConfigProvider!.token);
        if (response == 'Image Uploaded') {
          navigator!.goBack();
          navigator!.showSuccessMessage(
              message: "Image Uploaded Successfully",
              posActionTitle: "ok",
              posAction: goToHomeScreen);
        } else {
          navigator!.goBack();
          navigator!.showFailMessage(
              message: "Can't Upload the Image", posActionTitle: "ok");
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
    } else {
      navigator!.showSuccessMessage(
          message: "No Image ... No Problem \nYou Can Update It any Time",
          posActionTitle: "ok",
          posAction: goToHomeScreen);
    }
  }

  void goToHomeScreen() {
    navigator!.goToHomeScreen();
  }
}
