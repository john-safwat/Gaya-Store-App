import 'package:ecommerce/Core/Base/Base_State.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:ecommerce/Domain/Models/User/UserData.dart';
import 'package:ecommerce/Domain/UseCase/UpdateUserDataUseCase.dart';
import 'package:ecommerce/Presentation/UI/EditUserInfo/EditUserInfoNavigator.dart';
import 'package:ecommerce/Presentation/UI/EditUserInfo/EditUserInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Core/Theme/MyTheme.dart';

class EditUserInfoScreen extends StatefulWidget {

  static const String routeName = 'edit user info screen';

  @override
  State<EditUserInfoScreen> createState() => _EditUserInfoScreenState();
}

class _EditUserInfoScreenState extends BaseState<EditUserInfoScreen , EditUserInfoViewModel> implements EditUserInfoNavigator {
  bool isVisible = false;

  @override
  EditUserInfoViewModel initViewModel() {
    return EditUserInfoViewModel(UpdateUserDataUseCase(injectUserRepository())) ;
  }

  @override
  Widget build(BuildContext context) {
    if(viewModel.userData == null){
      viewModel.provider = Provider.of<AppConfigProvider>(context);
      viewModel.userData = ModalRoute.of(context)?.settings.arguments as UserData ;
      viewModel.updateControllers();
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title:const Text("Edit Your Info"),),
        body: Consumer<EditUserInfoViewModel>(
          builder: (context, value, child) =>  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // the name data field
                      dataFormField(
                        hintText: "Name",
                        titleText: "Enter Your Name",
                        icon: const Icon(Icons.badge_outlined),
                        keyboardType: TextInputType.text,
                        inputController: viewModel.nameController,
                        validation: viewModel.nameValidation,
                      ),
                      // the Email data field
                      dataFormField(
                        hintText: "Email",
                        titleText: "Enter Your Email",
                        icon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.text,
                        inputController: viewModel.emailController,
                        validation: viewModel.emailValidation,
                      ),
                      passwordFormField(
                        hintText: "Password",
                        titleText: "Enter Password",
                        keyboardType: TextInputType.text,
                        inputController: viewModel.passwordController,
                        validation: viewModel.passwordValidation,
                      ),
                      passwordFormField(
                        hintText: "Re-Password",
                        titleText: "Confirm Password",
                        keyboardType: TextInputType.text,
                        inputController:viewModel.rePasswordController,
                        validation: viewModel.passwordValidation,
                      ),
                      // the Phone data field
                      dataFormField(
                        hintText: "Phone",
                        titleText: "Enter Your Phone Number",
                        icon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        inputController: viewModel.phoneController,
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
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.onUpdateButtonPress();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlue)),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Update Your Data",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
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
      initialDate: viewModel.date,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      height: 320,
      barrierDismissible: false,
      theme: ThemeData(
        primaryColor: MyTheme.darkBlue,
        hintColor: MyTheme.darkBlue,
        dialogBackgroundColor: MyTheme.lightBlue,
        disabledColor: Colors.orange,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    );
    setState(() {
      viewModel.date = newDateTime!;
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
            color: MyTheme.darkBlue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: MyTheme.lightBlue,
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.darkBlue),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: icon,
            prefixIconColor: MyTheme.darkBlue,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
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
            color: MyTheme.darkBlue,
            fontSize: 18,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: MyTheme.lightBlue,
            hintText: hintText,
            hintStyle: const TextStyle(color: MyTheme.darkBlue),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: const Icon(Icons.lock_outline),
            prefixIconColor: MyTheme.darkBlue,
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
                  color: MyTheme.darkBlue,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.lightBlue)),
          ),
        ),
      ],
    );
  }
}
