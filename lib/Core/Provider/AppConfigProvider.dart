import 'package:flutter/foundation.dart';

class AppConfigProvider extends ChangeNotifier {
  String token = '';
  void updateToken (String token){
    this.token = token;
    debugPrint(token);
    notifyListeners();
  }
}