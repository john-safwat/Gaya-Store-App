import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class ButtonsWidget extends StatefulWidget {
  bool isInWishList ;
  Function onFavoritePress;
  ButtonsWidget(this.isInWishList , this.onFavoritePress);

  @override
  State<ButtonsWidget> createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
              onPressed: () {},
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
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: (){
            widget.onFavoritePress();
            setState(() {
              widget.isInWishList = !widget.isInWishList;
            });
          },
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: MyTheme.darkBlue),
            child: widget.isInWishList
                ? const Icon(Icons.favorite_rounded , size: 30,color: MyTheme.backGround,)
                : const Icon(Icons.favorite_border_rounded , size:30, color: MyTheme.backGround,),
          ),
        ),
        //
      ],
    );
  }
}