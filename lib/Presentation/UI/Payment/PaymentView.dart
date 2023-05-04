import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentNavigator.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = 'Payment Screen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> implements PaymentNavigator {
  @override
  Widget build(BuildContext context) {
    var products = ModalRoute.of(context)?.settings.arguments as List<OrderProducts>;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => Text(products[index].id!.toString()),
              separatorBuilder: (context, index) => Container(
                height: 2,
                width: double.infinity,
                margin:const EdgeInsets.all(10),
                color: Colors.black,
              ),
              itemCount: products.length) 
          ),
        ],
      ),
    );
  }
}