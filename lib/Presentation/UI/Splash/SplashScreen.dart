import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenView.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        backgroundColor: MyTheme.backGround,
        childWidget: SizedBox(
          child: Image.asset("assets/images/Logo.png" , height: 200, width: 200,)
        ),
        duration: const Duration(milliseconds:3000),
        animationDuration: const Duration(milliseconds: 1000),
        defaultNextScreen: LoginScreen(),
      )
    );
  }
}
