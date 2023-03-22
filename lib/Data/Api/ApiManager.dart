import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Models/UserModel/UserResponseDTO.dart';

class ApiManager {
  String baseUrl = '192.168.1.9';
  String path = '/E-Commerce-BackEnd/addUser.php';

  Future<UserResponseDTO> addNewUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String dateTime,
  }) async {
    Uri uri = Uri.http(baseUrl, path);
    var response  = await http.post(uri , body: {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone,
      'birthDate':dateTime,
    });
    return UserResponseDTO.fromJson(jsonDecode(response.body));
  }
}
