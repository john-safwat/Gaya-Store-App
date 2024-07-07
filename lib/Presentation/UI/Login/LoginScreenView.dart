import 'package:ecommerce/Core/Base/BaseState.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenNavigator.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenViewModel.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/DI/di.dart';
import '../../../Domain/UseCase/AuthLoginUserCase.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginScreenViewModel>
    implements LoginScreenNavigator {
  @override
  LoginScreenViewModel initViewModel() {
    return LoginScreenViewModel(
      useCase: AuthLoginUserCase(repository: injectAuthRepository()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<LoginScreenViewModel>(
        builder: (context, value, child) => Scaffold(
          body: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 50,),
              Form(
                key: viewModel.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Logo.png",
                          height: 200,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // the welcome text
                    Text(
                      'Welcome Back To Gaya Store',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // text field
                    TextFormField(
                      validator: (value) => viewModel.emailValidation(value!),
                      controller: viewModel.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      enableIMEPersonalizedLearning: true,
                      autocorrect: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // text field
                    TextFormField(
                      validator: (value) =>
                          viewModel.passwordValidation(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: viewModel.passwordController,
                      autocorrect: true,
                      obscureText: !viewModel.isVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                            overlayColor:
                            WidgetStateProperty.all(Colors.transparent),
                            onTap: (){
                              viewModel.changeVisibilityState();
                            },
                            child: Icon(
                              viewModel.isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget Password ?",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).secondaryHeaderColor),
                            )),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.onLoginButtonPress();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t Have Account ?",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).secondaryHeaderColor),
                        ),
                        TextButton(
                            onPressed: () {
                              viewModel.onCreateAccountButtonPress();
                            },
                            child: Text(
                              "Create Account",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
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
  updateToken(String token) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);
    provider.updateToken(token);
  }
}
