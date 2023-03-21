import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "RegistrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isVisible = false;
  RegistrationScreenViewModel viewModel = RegistrationScreenViewModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // the name data field
                        dataFormField(
                          hintText: "Name",
                          titleText: "Enter Your Name",
                          icon: const Icon(Icons.badge_outlined),
                          keyboardType: TextInputType.text,
                          inputController: nameController,
                          validation: viewModel.nameValidation,
                        ),
                        // the Email data field
                        dataFormField(
                          hintText: "Email",
                          titleText: "Enter Your Email",
                          icon: const Icon(Icons.email_outlined),
                          keyboardType: TextInputType.text,
                          inputController: emailController,
                          validation: viewModel.emailValidation,
                        ),
                        passwordFormField(
                          hintText: "Password",
                          titleText: "Enter Password",
                          keyboardType: TextInputType.text,
                          inputController: passwordController,
                          validation: viewModel.passwordValidation,
                        ),
                        passwordFormField(
                          hintText: "Re-Password",
                          titleText: "Confirm Password",
                          keyboardType: TextInputType.text,
                          inputController: rePasswordController,
                          validation: viewModel.rePasswordValidation,
                        ),
                        // the Phone data field
                        dataFormField(
                          hintText: "Phone",
                          titleText: "Enter Your Phone Number",
                          icon: const Icon(Icons.phone),
                          keyboardType: TextInputType.number,
                          inputController: phoneController,
                          validation: viewModel.phoneValidation,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor: MaterialStateProperty.all(MyTheme.blue)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
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
    );
  }

  // function to show the text field in the screen
  Widget dataFormField(
      {required String hintText,
      required String titleText,
      required Icon icon,
      required TextInputType keyboardType,
        required TextEditingController inputController ,
        required Function validation,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text above the title screen
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            titleText,
            style: const TextStyle(
                color: MyTheme.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        // text field
        TextFormField(
          validator: (value) => validation(value),
          controller: inputController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enableIMEPersonalizedLearning: true,
          autocorrect: true,
          style: const TextStyle(
            color: MyTheme.blue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.blue),
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: icon,
            prefixIconColor: MyTheme.blue,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
          ),
        )
      ],
    );
  }

  Widget passwordFormField(
      {required String hintText,
      required String titleText,
      required TextInputType keyboardType,
        required TextEditingController inputController ,
        required Function validation
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text above the title screen
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            titleText,
            style: const TextStyle(
                color: MyTheme.darkBlue,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        // text field
        TextFormField(
          validator: (value) => validation(value),
          controller: inputController,
          enableIMEPersonalizedLearning: true,
          autocorrect: true,
          obscureText: isVisible,
          style: const TextStyle(
            color: MyTheme.blue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.blue),
            contentPadding: const EdgeInsets.all(20),
            prefixIcon: const Icon(Icons.lock_outline),
            prefixIconColor: MyTheme.blue,
            suffix: InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: MyTheme.blue,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
          ),
        ),
      ],
    );
  }
}
