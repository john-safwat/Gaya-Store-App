import 'dart:io';

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

  XFile? image ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton(
              onPressed: ()async{
                image = await picker.pickImage(source: ImageSource.gallery);
                setState(() {

                });
              },
              child:const Text("TestImage"),
          ),
          image != null ? Image.file(File(image!.path)) : Text("no image"),
        ],
      ),
    );
  }
}
