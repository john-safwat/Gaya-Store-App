import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  String name;
  NameWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MyTheme.darkBlue),
    );
  }
}
