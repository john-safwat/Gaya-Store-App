import 'package:ecommerce/Core/Base/BaseState.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/AuthRegistrationUseCase.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenView.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenNavigator.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "RegistrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends BaseState<RegistrationScreen , RegistrationScreenViewModel> implements RegistrationScreenNavigator{
  @override
  RegistrationScreenViewModel initViewModel() {
    return RegistrationScreenViewModel(AuthRegistrationUseCase(injectAuthRepository()));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<RegistrationScreenViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Create Your Account",
              style: TextStyle(
                  color: MyTheme.darkBlue
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme:const IconThemeData(color: MyTheme.darkBlue),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // tha logo image in the top of the screen
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Logo.png",
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                    // the text field
                    Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 15),
                            // the name data field
                            TextFormField(
                              validator: (value) => viewModel.nameValidation(value!),
                              controller: viewModel.nameController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              enableIMEPersonalizedLearning: true,
                              autocorrect: true,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Name",
                                prefixIcon: Icon(Icons.badge_outlined),
                              ),
                            ),
                            const SizedBox(height: 15),
                            // the Email data field
                            TextFormField(
                              validator: (value) => viewModel.emailValidation(value!),
                              controller: viewModel.emailController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              enableIMEPersonalizedLearning: true,
                              autocorrect: true,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                            ),
                            const SizedBox(height: 15),
                            // password
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
                            const SizedBox(height: 15),
                            TextFormField(
                              validator: (value) =>
                                  viewModel.passwordValidation(value!),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: viewModel.rePasswordController,
                              autocorrect: true,
                              obscureText: !viewModel.isVisible,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
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
                            const SizedBox(height: 15),
                            // the Phone data field
                            TextFormField(
                              validator: (value) => viewModel.phoneValidation(value!),
                              controller: viewModel.phoneController,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              enableIMEPersonalizedLearning: true,
                              autocorrect: true,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: "Phone",
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: 15),
                            // date piker
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Birth Date",
                                  style: TextStyle(color: MyTheme.blue, fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    showMyDatePicker();
                                  },
                                  child: Text(
                                    DateFormat.yMMMd().format(viewModel.date),
                                    style: const TextStyle(color: MyTheme.blue, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // the registration button
                            ElevatedButton(
                              onPressed: () {
                                viewModel.register();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Register",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showMyDatePicker() async {
    viewModel.changeDate(await showDatePicker(
      context: context,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      barrierDismissible: false,
      currentDate: DateTime.now(),
    ));
  }


  @override
  goToPickImageScreen() {
    Navigator.pushReplacementNamed(context, PickImageScreen.routeName);
  }


}
