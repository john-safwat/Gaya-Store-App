import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyDialogUtils{
  static showErrorDialog({required BuildContext context , required String message}){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: message,
    );
  }
  static showLoading ({required BuildContext context , required String message}){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: message,
    );
  }
  static showSuccessDialog ({required BuildContext context , required String message}){
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: message,
      onConfirmBtnTap: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }
    );
  }
  static hideDialog({required BuildContext context}){
    Navigator.pop(context);
  }
}