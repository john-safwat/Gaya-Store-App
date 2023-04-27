import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color darkBlue = Color(0xff0D2E58);
  static const Color blue = Color(0xff318EC7);
  static const Color lightBlue = Color(0xffD4EEF3);
  static const Color backGround = Color(0xffE9FFFD);


  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backGround ,
    primaryColor: darkBlue,
    canvasColor: darkBlue,
    appBarTheme:const AppBarTheme(
      backgroundColor: darkBlue,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )
      ),
    )
  );
}
