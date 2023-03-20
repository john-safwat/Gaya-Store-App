import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenView.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenView.dart';
import 'package:ecommerce/Presentation/UI/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeName :(_) => SplashScreen(),
        LoginScreen.routeName :(_) => LoginScreen(),
        RegistrationScreen.routeName :(_) => RegistrationScreen(),
      },
      initialRoute: SplashScreen.routeName,
      theme: MyTheme.darkTheme,
    );
  }
}
