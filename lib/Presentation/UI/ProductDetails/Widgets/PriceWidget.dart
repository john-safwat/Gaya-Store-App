import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  String price ;
  PriceWidget(this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text(
        "Price : $price EGP",
        style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: MyTheme.darkBlue),
      ),
    );
  }
}
