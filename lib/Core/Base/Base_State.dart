import 'package:ecommerce/Core/Base/Base_Navigator.dart';
import 'package:ecommerce/Core/Base/Base_View_Model.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget , VM  extends BaseViewModel> extends State<T> implements BaseNavigator{
  late VM viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  VM initViewModel();

  @override
  showErrorMessage(String message) {
    MyDialogUtils.showErrorDialog(context: context, message: message);
  }

  @override
  hideDialog() {
    MyDialogUtils.hideDialog(context: context);
  }

  @override
  showLoading(String message) {
    MyDialogUtils.showLoading(context: context, message: message);
  }

  @override
  showSuccessMessage(String message, Function action) {
    MyDialogUtils.showSuccessDialog(
        context: context, message: message, action: action);
  }
}