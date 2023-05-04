import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
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
            themeColor: MyTheme.darkBlue ,
            onCreditCardModelChange: (creditCardModel) {
              viewModel.changeCardData(creditCardModel);
            },
            cardHolderValidator: (value) => viewModel.cardValidation(value),
            cvvValidator: (value)=> viewModel.cardValidation(value),
            cardNumberValidator: (value) => viewModel.cardValidation(value),
            expiryDateValidator: (value) => viewModel.cardValidation(value),
            cardNumberDecoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: MyTheme.darkBlue,
                  fontSize: 18
              ),
              contentPadding:const EdgeInsets.all(20),
              filled: true,
              fillColor: MyTheme.lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              hintText: 'Card Number',
            ),
            expiryDateDecoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: MyTheme.darkBlue,
                  fontSize: 18
              ),
              contentPadding:const EdgeInsets.all(20),
              filled: true,
              fillColor: MyTheme.lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),

              hintText: 'Expire Date',
            ),
            cvvCodeDecoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: MyTheme.darkBlue,
                  fontSize: 18
              ),
              contentPadding:const EdgeInsets.all(20),
              filled: true,
              fillColor: MyTheme.lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              hintText: 'CVV',
            ),
            cardHolderDecoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: MyTheme.darkBlue,
                  fontSize: 18
              ),
              contentPadding:const EdgeInsets.all(20),
              filled: true,
              fillColor: MyTheme.lightBlue,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
              hintText: 'Card Holder',
            ),
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
