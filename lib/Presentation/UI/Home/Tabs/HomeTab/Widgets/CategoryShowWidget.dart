import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Theme/MyTheme.dart';

class CategoryShowWidget extends StatelessWidget {
  Categories categories;
  CategoryShowWidget({required this.categories});

  @override
  Widget build(BuildContext context) {
    HomeTabViewModel viewModel = Provider.of<HomeTabViewModel>(context);
    return InkWell(
      onTap: (){
        viewModel.goToProductsListScreen(categories);
      },
      child: SizedBox(
        width: 110,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(15),
                margin:const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyTheme.lightBlue,
                ),
                child: Image.network(categories.image! , height: 50,),
              ),
              Text(
                categories.name!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
