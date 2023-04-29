import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/ProductWidget.dart';
import 'package:flutter/material.dart';

class HomeProductList extends StatelessWidget {
  List<Product> products ;
  HomeProductList(this.products);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          physics:const BouncingScrollPhysics(),

          itemBuilder: (context, index) => ProductWidget(products[index]),
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
    ));
  }
}
