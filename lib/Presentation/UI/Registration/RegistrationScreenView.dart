import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:ecommerce/Domain/UseCase/AuthRegistrationUseCase.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenNavigator.dart';
import 'package:ecommerce/Presentation/UI/Registration/RegistrationScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "RegistrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    implements RegistrationScreenNavigator {
  bool isVisible = false;
  RegistrationScreenViewModel viewModel = RegistrationScreenViewModel(
      AuthRegistrationUseCase(injectAuthRepository()));
  DateTime date = DateTime.now();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                      key: formKey,
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
                            validation: viewModel.passwordValidation,
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
                          const SizedBox(
                            height: 30,
                          ),
                          // date piker
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Birth Date",
                                style: TextStyle(
                                    color: MyTheme.blue, fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  showMyDatePicker();
                                },
                                child: Text(
                                  DateFormat.yMMMd().format(date),
                                  style: const TextStyle(
                                      color: MyTheme.blue, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // the registration button
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all(MyTheme.blue)),
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

  void showMyDatePicker() async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      height: 320,
      barrierDismissible: false,
      theme: ThemeData(
        primaryColor: MyTheme.darkBlue,
        accentColor: MyTheme.darkBlue,
        dialogBackgroundColor: MyTheme.lightBlue,
        disabledColor: Colors.orange,
        accentTextTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    );
    setState(() {
      date = newDateTime!;
    });
  }

  // function to show the text field in the screen
  Widget dataFormField({
    required String hintText,
    required String titleText,
    required Icon icon,
    required TextInputType keyboardType,
    required TextEditingController inputController,
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
            height: 1.5,
            color: MyTheme.blue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.blue),
            contentPadding: const EdgeInsets.all(12),
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

  // function to show the password text field in the screen
  Widget passwordFormField(
      {required String hintText,
      required String titleText,
      required TextInputType keyboardType,
      required TextEditingController inputController,
      required Function validation}) {
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: inputController,
          enableIMEPersonalizedLearning: true,
          autocorrect: true,
          obscureText: !isVisible,
          style: const TextStyle(
            height: 1.5,
            color: MyTheme.blue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.blue),
            contentPadding: const EdgeInsets.all(12),
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
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
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

  // call the function register from the viewModel
  void register() {
    if (formKey.currentState!.validate()) {
      viewModel.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: rePasswordController.text,
          phone: phoneController.text,
          date: date);
    } else {
      debugPrint("invalid data");
    }
  }

  @override
  showErrorMessage(String message) {
    MyDialogUtils.showErrorDialog(context: context, message: message);
  }

  @override
  hideDialog() {
    MyDialogUtils.hideDialog(context: context);
  }
}
