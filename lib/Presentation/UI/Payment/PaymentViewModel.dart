import 'package:ecommerce/Core/Base/BaseViewModel.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/UseCase/PlaceOrderUseCase.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentViewModel extends BaseViewModel<PaymentNavigator> {
  PlaceOrderUseCaseDTO useCase;

  PaymentViewModel(this.useCase);

  int selectedIndex = 0;
  List<OrderProducts>? products;

  final formKey = GlobalKey<FormState>();
  GlobalKey<FormState> cardFormKey = GlobalKey();
  bool showBackSide = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  TextEditingController nameOnCard = TextEditingController();
  TextEditingController numberOnCard = TextEditingController();
  TextEditingController cvvCode = TextEditingController();
  TextEditingController expiryDate = TextEditingController();

  OrderResponse orderResponse = OrderResponse();

  void onBackPress() {
    if (selectedIndex == 0) {
      navigator!.goToHomeScreenCartTab();
    } else if (selectedIndex == 1) {
      selectedIndex = 0;
    } else if (selectedIndex == 2) {
      navigator!.goToHomeScreenHomeTab();
    }
    notifyListeners();
  }

  double calcTotal() {
    double total = 0;
    for (int i = 0; i < products!.length; i++) {
      total += products![i].orderTotal!;
    }
    return total;
  }

  String? nameValidation(String? name) {
    if (name == null || name.isEmpty) {
      return "Enter Name";
    }
    return null;
  }

  String? addressValidation(String? address) {
    if (address == null || address.isEmpty) {
      return "Enter Shipping Address";
    }
    return null;
  }

  String? phoneValidation(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Enter Phone Number";
    }
    return null;
  }

  String? postalCodeValidation(String? postalCode) {
    if (postalCode == null || postalCode.isEmpty) {
      return "Enter Postal Code";
    }
    return null;
  }

  void onContinueToPaymentPress() {
    if (formKey.currentState!.validate()) {
      selectedIndex = 1;
      notifyListeners();
    }
  }

  String? cardValidation(String? number) {
    if (number == null || number.isEmpty) {
      return "Inputs Can't be Empty";
    }
    return null;
  }

  void onCompletePaymentPress() async {
    if (cardFormKey.currentState!.validate()) {
      navigator!.showLoading(message: "Loading");
      try {
        var response = await useCase.invoke(
            appConfigProvider!.token,
            nameController.text,
            phoneController.text,
            addressController.text,
            numberOnCard.text,
            "Not Completed",
            postalCodeController.text,
            calcTotal(),
            products);
        navigator!.goBack();
        navigator!.showSuccessMessage(
            message: response.message!,
            posActionTitle: "ok",);
        orderResponse = response;
        selectedIndex = 2;
        notifyListeners();
      } catch (e) {
        navigator!.goBack();
        navigator!.showFailMessage(message: e.toString(), posActionTitle: "ok");
      }
    }
  }

  void changeCardData(CreditCardModel creditCardModel) {
    numberOnCard.text = creditCardModel.cardNumber;
    expiryDate.text = creditCardModel.expiryDate;
    nameOnCard.text = creditCardModel.cardHolderName;
    cvvCode.text = creditCardModel.cvvCode;
    notifyListeners();
  }

  void onContinueShoppingPress() {
    navigator!.goToHomeScreenHomeTab();
  }
}
