import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color darkBlue = Color(0xff0D2E58);
  static const Color blue = Color(0xff318EC7);
  static const Color lightBlue = Color(0xffD4EEF3);
  static const Color backGround = Color(0xffE9FFFD);

  // static const Color darkBlue = Color(0xff1E2022);
  // static const Color blue = Color(0xff52616B);
  // static const Color lightBlue = Color(0xffC9D6DF);
  // static const Color backGround = Color(0xffF0F5F9);

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backGround ,
    primaryColor: darkBlue,
    canvasColor: darkBlue,
    appBarTheme:const AppBarTheme(
      backgroundColor: darkBlue,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )
      ),
    )
  );
}
