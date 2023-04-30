import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  String desctiption;
  DescriptionWidget(this.desctiption);
  @override
  Widget build(BuildContext context) {
    return Text(
      desctiption,
      style: const TextStyle(
        color: MyTheme.darkBlue,
        fontSize: 16,
      ),
    );
  }
}
