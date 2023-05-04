import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText ;
  TextEditingController controller ;
  IconData prefix;
  TextInputType keyboard;
  Function validation;
  MyTextField(this.hintText , this.controller , this.prefix , this.keyboard , this.validation);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      child: TextFormField(
        keyboardType: keyboard,
        validator:(value) => validation(value),
        style:  const TextStyle(
            color: MyTheme.darkBlue,
            fontSize: 18
        ),
        controller: controller,
        cursorColor: MyTheme.darkBlue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: MyTheme.darkBlue,
              fontSize: 18
          ),
          contentPadding:const EdgeInsets.all(20),
          filled: true,
          fillColor: MyTheme.lightBlue,
          prefixIcon: Icon(prefix , color: MyTheme.darkBlue,),
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
        ),
      ),
    );;
  }
}
