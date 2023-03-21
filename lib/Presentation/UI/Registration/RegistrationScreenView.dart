import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "RegistrationScreen";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // test image piker
  final ImagePicker picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // the name data field
                      dataFormField(
                        hintText: "Name",
                        titleText: "Enter Your Name",
                        icon: const Icon(Icons.badge_outlined),
                        keyboardType: TextInputType.text,
                      ),
                      // the Email data field
                      dataFormField(
                        hintText: "Email",
                        titleText: "Enter Your Email",
                        icon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.text,
                      ),
                      passwordFormField(
                          hintText: "Password",
                          titleText: "Enter Password",
                          keyboardType: TextInputType.text
                      ),
                      // the Phone data field
                      dataFormField(
                        hintText: "Phone",
                        titleText: "Enter Your Phone Number",
                        icon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                      ),
                  ],
                ))
              ],
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
      required TextInputType keyboardType}) {
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
      required TextInputType keyboardType}) {
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
            prefixIcon: const Icon(Icons.lock_outline),
            prefixIconColor: MyTheme.blue,
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_outlined),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: MyTheme.blue)),
            errorBorder: OutlineInputBorder(
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
