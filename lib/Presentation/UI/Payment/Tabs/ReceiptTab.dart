import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReceiptTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PaymentViewModel viewModel = Provider.of<PaymentViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/shipping3.png"),
          Container(
            margin:const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Logo.png"),
              ],
            ),
          ),
          Text(
            "Hay ${viewModel.orderResponse.userName}\nThanks for your Purchases.",
            style: const TextStyle(
              color: MyTheme.darkBlue,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: double.infinity,
            height: 3,
            margin:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyTheme.lightBlue, 
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          contentRow("Order Number", viewModel.orderResponse.orderNumber!.toString()),
          contentRow("Products Total", "${viewModel.orderResponse.total!} EGP"),
          contentRow("Shipping Charge", "${viewModel.orderResponse.shippingCharge!} EGP"),
          contentRow("No.of Products", "${viewModel.orderResponse.shippingCharge!~/10}"),
          Container(
            width: double.infinity,
            height: 3,
            margin:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: MyTheme.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          contentRow("Total", "${viewModel.orderResponse.shippingCharge! + viewModel.orderResponse.total!} EGP"),
          Container(
            margin:const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: (){
                viewModel.onContinueShoppingPress();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue)
              ),
              child: const Padding(
                padding:  EdgeInsets.all(15.0),
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              )),
          ),
        ],
      ),
    );
  }

  Widget contentRow(String title , String value){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:const TextStyle(
                color: Color(0xFF97A1A3),
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            value,
            style: const TextStyle(
                color: MyTheme.darkBlue,
                fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

}
