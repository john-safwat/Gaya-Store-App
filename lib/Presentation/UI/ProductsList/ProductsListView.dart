import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductsByCategoryIdUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/ProductWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsView.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListNavigator.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Global Widgets/errorWidget.dart';

class ProductsListScreen extends StatefulWidget {
  static const String routeName = 'ProductList';

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen>
    implements ProductsListNavigator {
  ProductsListViewModel viewModel = ProductsListViewModel(
    GetProductsByCategoryIdUseCase(injectProductRepository()),
    AddToWishListUseCase(injectProductRepository()),
    DeleteFromWishListUseCase(injectProductRepository())
  );
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    Categories category =
        ModalRoute.of(context)!.settings.arguments as Categories;
    if (viewModel.categoryId == 0) {
      viewModel.getProductsByCategoryId(double.parse(category.id!.toString()));
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name == null ? "none text" : category.name!),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ProductsListViewModel>(
              builder: (context, value, child) {
                if (value.errorMessage != null) {
                  // if the value of error message is not null then user will be able to try again
                  return errorWidget(
                      value.errorMessage!, value.onTryAgainButtonPress);
                } else if (value.products == null) {
                  // if there is no error and dat not loaded it will show circular progress indicator
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.darkBlue,
                    ),
                  );
                } else {
                  // this will show the data if loaded
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              mainAxisExtent: 280,
                              childAspectRatio: 0.75),
                      itemBuilder: (context, index) => ProductWidget(
                          value.products![index], value.onWidgetPress , value.onFavoritePress),
                      itemCount: value.products!.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void goToProductDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }
}
