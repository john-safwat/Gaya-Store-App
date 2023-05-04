import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/CategoryShowWidget.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  List<Categories> categories ;
  CategoriesList(this.categories);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.builder(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryShowWidget(categories: categories[index]),
        itemCount: categories.length,
      ),
    );
  }
}
