import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier{
  GetProductDetailsUseCase useCase ;
  ProductDetailsViewModel(this.useCase);
}