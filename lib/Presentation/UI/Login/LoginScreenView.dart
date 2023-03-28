import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenNavigator.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenViewModel.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../Core/DI/di.dart';
import '../../../Domain/UseCase/AuthLoginUserCase.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginScreenNavigator{


  LoginScreenViweModel viewModel = LoginScreenViweModel(useCase:AuthLoginUserCase( repository: injectAuthRepository()),);


  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Logo.png",
                        height: 150,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // the welcome text
                  const Text(
                    'Welcome Back To Gaya Store',
                    style: TextStyle(
                        color: MyTheme.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field
                  TextFormField(
                    validator: (value) => viewModel.emailValidation(value!),
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    enableIMEPersonalizedLearning: true,
                    autocorrect: true,
                    style: const TextStyle(
                      height: 1.5,
                      color: MyTheme.blue,
                      fontSize: 18,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(color: MyTheme.blue),
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: const Icon(Icons.email_outlined),
                      prefixIconColor: MyTheme.blue,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // text field
                  TextFormField(
                    validator: (value) => viewModel.passwordValidation(value!),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    enableIMEPersonalizedLearning: true,
                    autocorrect: true,
                    obscureText: !isVisible,
                    style: const TextStyle(
                      height: 1.5,
                      color: MyTheme.blue,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(color: MyTheme.blue),
                      contentPadding: const EdgeInsets.all(12),
                      prefixIcon: const Icon(Icons.lock_outline),
                      prefixIconColor: MyTheme.blue,
                      suffix: InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: MyTheme.blue,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 2, color: MyTheme.blue)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(fontSize: 18, color: MyTheme.blue),
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            viewModel.onLoginButtonPress(emailController.text , passwordController.text);
                          }
                        },
                        style: ButtonStyle(
                            shape:
                                MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(MyTheme.blue)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t Have Account ?",
                            style: TextStyle(
                                color: MyTheme.darkBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {
                                viewModel.onCreateAccountButtonPress();
                              },
                              child: const Text(
                                "Create Account",
                                style: TextStyle(
                                    color: MyTheme.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  goToCreateAccountScreen() {
    Navigator.pushNamed(context, RegistrationScreen.routeName);
  }

  @override
  goToHomeScreen() {
    Navigator.popAndPushNamed(context, HomeScreen.routeName);
  }

  @override
  showErrorMessage(String message) {
    MyDialogUtils.showErrorDialog(context: context, message: message);
  }

  @override
  hideDialog() {
    MyDialogUtils.hideDialog(context: context);
  }

  @override
  showLoading(String message) {
    MyDialogUtils.showLoading(context: context, message: message);
  }


  @override
  showSuccessMessage(String message, Function action) {
    MyDialogUtils.showSuccessDialog(
        context: context, message: message, action: action);
  }

  @override
  updateToken(String token) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);
    provider.updateToken(token);
  }

}
