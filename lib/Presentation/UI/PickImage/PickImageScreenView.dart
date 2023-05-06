import 'dart:io';
import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/AuthUploadUserImageUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenNavidator.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Core/Utils/Dialog_Utils.dart';

class PickImageScreen extends StatefulWidget {
  static const String routeName = 'pickImage';

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> implements PickImageScreenNavigator {
  final ImagePicker picker = ImagePicker();
  XFile? images;
  File? image;

  PickImageScreenViewModel viewModel = PickImageScreenViewModel(
      AuthUploadUserImageUseCase(injectAuthRepository()));

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }
  @override
  void dispose() {
    super.dispose();
    viewModel.navigator =  null ;
  }

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              child: image == null
                  ? Image.asset(
                      "assets/images/Splash Screen.png",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    )
                  : Image.file(
                      image!,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ).blurred(blur: 5, blurColor: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // the title
                  Text(
                    "Pick Your Profile Image",
                    style: TextStyle(
                        color: image == null ? MyTheme.blue : Colors.white ,
                        fontSize: 26
                    ),
                  ),
                  // the image
                  InkWell(
                    onTap: () async {
                      images =
                          await picker.pickImage(source: ImageSource.gallery);
                      image = File(images!.path);
                      setState(() {});
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: MyTheme.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(-1, 3))
                          ]),
                      child: image == null
                          ? const Center(
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 100,
                                color: MyTheme.blue,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )),
                    ),
                  ),
                  // the submit button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.uploadImage(image, provider.token);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyTheme.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
  goToHomeScreen() {
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, HomeScreen.routeName);
  }
}
