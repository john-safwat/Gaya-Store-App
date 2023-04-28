import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class errorWidget extends StatelessWidget {

  String errorMessage;
  Function onTryAgainPress;
  errorWidget (this.errorMessage, this.onTryAgainPress);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(),
        Text(
          "Ops There Is an Error Loading Data \n${errorMessage}",
          style: const TextStyle(fontSize: 22, color: MyTheme.darkBlue),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
            onPressed: () {
              onTryAgainPress();
            },
            child: const Text("Try Again"))
      ],
    );
  }
}
