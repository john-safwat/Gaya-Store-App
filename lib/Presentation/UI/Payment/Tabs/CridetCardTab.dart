import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

class CreditCardTab extends StatefulWidget {

  @override
  State<CreditCardTab> createState() => _CreditCardTabState();
}

class _CreditCardTabState extends State<CreditCardTab> {
  @override
  Widget build(BuildContext context) {
    PaymentViewModel viewModel = Provider.of<PaymentViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/shipping2.png"),
          CreditCardWidget(
            cardNumber: viewModel.numberOnCard.text,
            expiryDate: viewModel.expiryDate.text,
            cardHolderName: viewModel.nameOnCard.text,
            cvvCode: viewModel.cvvCode.text,
            showBackView: false,
            onCreditCardWidgetChange: (value) {},
          ),
          CreditCardForm(
            cardHolderName: viewModel.nameOnCard.text,
            cardNumber: viewModel.numberOnCard.text,
            cvvCode: viewModel.cvvCode.text,
            expiryDate:viewModel.expiryDate.text ,
            formKey: viewModel.cardFormKey,
            obscureCvv: true,
            obscureNumber: true,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            onCreditCardModelChange: (creditCardModel) {
              viewModel.changeCardData(creditCardModel);
            },
            cardHolderValidator: (value) => viewModel.cardValidation(value),
            cvvValidator: (value)=> viewModel.cardValidation(value),
            cardNumberValidator: (value) => viewModel.cardValidation(value),
            expiryDateValidator: (value) => viewModel.cardValidation(value),
          ),
          Container(
            margin:const EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  viewModel.onCompletePaymentPress();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Complete Payment',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
