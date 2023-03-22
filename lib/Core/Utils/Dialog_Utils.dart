import 'package:flutter/cupertino.dart';
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
  static hideDialog({required BuildContext context}){
    Navigator.pop(context);
  }
}