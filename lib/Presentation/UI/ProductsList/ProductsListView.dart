import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:flutter/material.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);
  static const String routeName = 'ProductList';
  @override
  Widget build(BuildContext context) {
    Categories category = ModalRoute.of(context)!.settings.arguments as Categories;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name!
        ),
      ),
    );
  }
}
