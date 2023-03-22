import 'dart:convert';
import 'dart:io';
import "package:async/async.dart";
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import '../Models/UserModel/UserResponseDTO.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getApiManager(){
    _instance ??= ApiManager._();
    return _instance!;
  }

  String baseUrl = '192.168.1.9';
  String addUserPath = '/E-Commerce-BackEnd/addUser.php';
  String addUserImagePath = '/E-Commerce-BackEnd/addUserImage.php';

  // function to call database to add user
  Future<UserResponseDTO> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  }) async {
    Uri uri = Uri.http(baseUrl, addUserPath);
    var response  = await http.post(uri , body: {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
      'birthDate':dateTime,
    });
    return UserResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to update user image
  Future<String> uploadUserImage(File image , String token)async {
    Uri uri = Uri.http(baseUrl, addUserImagePath);

    var stream= http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length= await image.length();
    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile("image", stream, length, filename: basename(image.path));
    request.files.add(multipartFile);
    request.fields['token'] = token;

    var respond = await request.send();

    if(respond.statusCode==200){
      return "Image Uploaded";
    }else{
      return "Upload Failed";
    }
  }
}
