import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String token = '';

  void updateToken (String token) async{
    this.token = token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(token.isNotEmpty){
      await prefs.setString("token", this.token);
    }
    notifyListeners();
  }
}