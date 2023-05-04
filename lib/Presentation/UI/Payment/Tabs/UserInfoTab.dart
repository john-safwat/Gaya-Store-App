import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentViewModel.dart';
import 'package:ecommerce/Presentation/UI/Payment/Widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PaymentViewModel viewModel = Provider.of<PaymentViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/shipping1.png"),
          Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  MyTextField(
                      "Name", viewModel.nameController, Icons.person , TextInputType.text , viewModel.nameValidation),
                  MyTextField(
                      "Address", viewModel.addressController, Icons.map , TextInputType.streetAddress  , viewModel.addressValidation),
                  MyTextField(
                      "Phone", viewModel.phoneController, Icons.phone , TextInputType.phone ,viewModel.phoneValidation),
                  MyTextField("Postal Code", viewModel.postalCodeController,
                      Icons.local_post_office , TextInputType.number ,  viewModel.postalCodeValidation),
                ],
              )),
          Container(
            padding:const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10
                  )
                ],
                color: MyTheme.lightBlue,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(color: MyTheme.darkBlue, fontSize: 20),
                      ),
                      Text(
                        "${viewModel.calcTotal()} EGP",
                        style: const TextStyle(
                            color: MyTheme.darkBlue, fontSize: 20),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.onContinueToPaymentPress();
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
                            'Continue to payment',
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.white,),
                        ],
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
