import 'package:ecommerce/Core/Base/BaseNavigator.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:flutter/material.dart';

class BaseViewModel <N extends BaseNavigator> extends ChangeNotifier{
  N? navigator ;
  AppConfigProvider? appConfigProvider;


}