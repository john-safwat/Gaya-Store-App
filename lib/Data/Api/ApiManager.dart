import 'dart:convert';
import 'dart:io';
import "package:async/async.dart";
import 'package:ecommerce/Data/Models/CreateUserResponseDTO.dart';
import 'package:ecommerce/Data/Models/LoginResponseDTO.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;

  static ApiManager getApiManager(){
    _instance ??= ApiManager._();
    return _instance!;
  }

  String baseUrl = '192.168.1.9';
  String addUserRoute = '/E-Commerce-BackEnd/E-Commerce-Database/public/api/users/create';
  String addUserImageRoute = '/E-Commerce-BackEnd/E-Commerce-Database/public/api/users/uploadImage';
  String loginRoute = '/E-Commerce-BackEnd/E-Commerce-Database/public/api/users/uploadImage';

  // function to call database to add user
  Future<CreateUserResponseDTO> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  }) async {
    Uri uri = Uri.http(baseUrl, addUserRoute);
    var response  = await http.post(uri , body: {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
      'birthDate':dateTime,
    });
    return CreateUserResponseDTO.fromJson(jsonDecode(response.body));
  }

  // function to update user image
  Future<String> uploadUserImage(File image , String token)async {
    Uri uri = Uri.http(baseUrl, addUserImageRoute);

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

  // function to login
  Future<LoginResponseDTO> login(String email , String password )async{
    Uri uri = Uri.http(baseUrl , loginRoute);
    var response  = await http.post(uri , body: {
      'email':email,
      'password':password,
    });

    return LoginResponseDTO.fromJson(jsonDecode(response.body));
  }
}
