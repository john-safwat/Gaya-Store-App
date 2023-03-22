import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/AuthUploadUserImageUseCase.dart';
import 'package:ecommerce/Presentation/UI/PickImage/PickImageScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PickImageScreen extends StatefulWidget {
  static const String routeName = 'pickImage';

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? images ;
  File? image;

  PickImageScreenViewModel viewModel = PickImageScreenViewModel(AuthUploadUserImageUseCase(injectAuthRepository()));

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const Text(
                  "Pick Your Profile Image",
                  style: TextStyle(
                    color: MyTheme.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: ()async{
                    images = await picker.pickImage(source: ImageSource.gallery);
                    image = File(images!.path);
                    setState(() {});
                  },
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          offset:const Offset(-1,3)
                        )
                      ]
                    ),
                    child:image==null? const Center(
                      child: Icon(Icons.camera_alt_rounded , size: 100, color: MyTheme.blue,),
                    ): ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(image! , fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          viewModel.uploadImage(image, provider.token);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyTheme.blue),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ))
                        ),
                        child:const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
