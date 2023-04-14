import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:flutter/cupertino.dart';

class HomeTabViewModel extends ChangeNotifier {
  GetCategoriesUseCase useCase ;
  HomeTabViewModel(this.useCase);

  List<Categories>? categories;

  void getCategories() async{
    var response = await useCase.invoke();
    categories = response.categories;
    notifyListeners();
  }

}