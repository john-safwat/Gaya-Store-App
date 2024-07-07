import 'package:ecommerce/Core/Base/BaseNavigator.dart';
import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Utils/DialogUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget , VM  extends BaseViewModel> extends State<T> implements BaseNavigator{
  late VM viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
    viewModel.appConfigProvider = Provider.of<AppConfigProvider>(context , listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
    viewModel.appConfigProvider = null;
  }

  VM initViewModel();

  @override
  goBack() {
    Navigator.pop(context);
  }


  @override
  showFailMessage({required String message, String? posActionTitle, VoidCallback? posAction, String? negativeActionTitle, VoidCallback? negativeAction,}) {
    MyDialogUtils.showFailMessage(
      context: context,
      message: message,
      negativeActionTitle: negativeActionTitle,
      posActionTitle: posActionTitle,
      posAction: posAction,
      negativeAction: negativeAction,
    );
  }

  @override
  showLoading({required String message,}) {
    MyDialogUtils.showLoadingDialog(
      context: context,
      message: message,
    );
  }

  @override
  showQuestionMessage({required String message, String? posActionTitle, VoidCallback? posAction, String? negativeActionTitle, VoidCallback? negativeAction,}) {
    MyDialogUtils.showQuestionMessage(
      context: context,
      message: message,
      negativeActionTitle: negativeActionTitle,
      posActionTitle: posActionTitle,
      posAction: posAction,
      negativeAction: negativeAction,
    );
  }

  @override
  showSuccessMessage({required String message, String? posActionTitle, VoidCallback? posAction, String? negativeActionTitle, VoidCallback? negativeAction,}) {
    MyDialogUtils.showSuccessMessage(
      context: context,
      message: message,
      negativeActionTitle: negativeActionTitle,
      posActionTitle: posActionTitle,
      posAction: posAction,
      negativeAction: negativeAction,
    );
  }

}