import 'package:flutter/material.dart';

class MyTheme {
  static const Color darkBlue = Color(0xff0D2E58);
  static const Color blue = Color(0xff318EC7);
  static const Color lightBlue = Color(0xffD4EEF3);
  static const Color backGround = Color(0xffE9FFFD);



  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      // app bar theme
      appBarTheme: const AppBarTheme(
          backgroundColor: darkBlue,
          foregroundColor: lightBlue,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20, color: lightBlue),
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          elevation: 0
      ),
      // set the scaffold background color with the color white
      scaffoldBackgroundColor: backGround,
      // set the primary color with the color black
      primaryColor: darkBlue,
      // set the accent color
      secondaryHeaderColor: blue,
      // set the text styles
      textTheme: const TextTheme(
          titleLarge: TextStyle(color: darkBlue),
          titleMedium: TextStyle(color: darkBlue),
          titleSmall: TextStyle(color: darkBlue),
          labelLarge: TextStyle(color: darkBlue),
          labelMedium: TextStyle(color: darkBlue),
          labelSmall: TextStyle(color: darkBlue),
          bodyLarge: TextStyle(color: darkBlue),
          bodyMedium: TextStyle(color: darkBlue),
          bodySmall: TextStyle(color: darkBlue)),
      // set the color of the progress indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: darkBlue,
      ),
      // set the elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: WidgetStateProperty.all(darkBlue),
              foregroundColor: WidgetStateProperty.all(lightBlue),
              elevation: WidgetStateProperty.all(0),
              textStyle: WidgetStateProperty.all(const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16, color: lightBlue)))),
      // set the dialog background color
      dialogTheme: const DialogTheme(
        backgroundColor: lightBlue,
      ),

      // set the text from filed decoration
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        iconColor: darkBlue,
        contentPadding: const EdgeInsets.all(15),
        hintStyle: const TextStyle(color: darkBlue, fontSize: 16),
        prefixIconColor: darkBlue,
        suffixIconColor: darkBlue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: darkBlue,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: darkBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: darkBlue,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
      ),
      dividerTheme:const DividerThemeData( color: darkBlue ),
      // set text button theme
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor:WidgetStateProperty.all(lightBlue) ,
              textStyle: WidgetStateProperty.all(const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: lightBlue)))),

      // set modal bottom sheet style
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: backGround,
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          modalBarrierColor: darkBlue.withOpacity(0.5)
      ),

      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
              color: lightBlue,
              fontSize: 12,
            )
        ),
      ),

    datePickerTheme: DatePickerThemeData(
      surfaceTintColor: blue,
      todayBackgroundColor: WidgetStateProperty.all(darkBlue),
      backgroundColor: backGround,
      dividerColor: blue,
      cancelButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(blue)),
      confirmButtonStyle: ButtonStyle(foregroundColor: WidgetStateProperty.all(blue)),
      dayForegroundColor: WidgetStateProperty.all(blue),
      inputDecorationTheme:InputDecorationTheme(
        labelStyle:const TextStyle(color: lightBlue, fontSize: 12),
        focusColor: blue,
        helperStyle: const TextStyle(color: blue, fontSize: 12),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        iconColor: blue,
        contentPadding: const EdgeInsets.all(15),
        hintStyle: const TextStyle(color: lightBlue, fontSize: 16),
        prefixIconColor: blue,
        suffixIconColor: blue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: darkBlue,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: darkBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: darkBlue,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.red,
            )),
      ),
      weekdayStyle:const TextStyle(color: blue),
      headerHelpStyle: const TextStyle(color: blue),
      yearForegroundColor: WidgetStateProperty.all(blue),
      yearStyle: const TextStyle(color: blue),
      headerHeadlineStyle:const TextStyle(color: lightBlue) ,
      headerBackgroundColor: darkBlue,
      headerForegroundColor: lightBlue,
      rangePickerBackgroundColor: backGround,
    ),

      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          backgroundColor: darkBlue,
          selectedIconTheme: IconThemeData(color: lightBlue),
          unselectedIconTheme:IconThemeData(color: lightBlue) ,
          showUnselectedLabels: false,
          showSelectedLabels: false
      ),
  );
}
