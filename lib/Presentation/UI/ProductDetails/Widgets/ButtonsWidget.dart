import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsWidget extends StatefulWidget {
  Function onAddToCartPress;
  ButtonsWidget(this.onAddToCartPress);

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
              onPressed: () {
                widget.onAddToCartPress(provider.token);
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(MyTheme.darkBlue),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      size: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )),
        //
      ],
    );
  }
}
