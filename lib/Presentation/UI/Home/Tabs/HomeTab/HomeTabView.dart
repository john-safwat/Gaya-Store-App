import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetNewAddedProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/BannerSlideShow.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/ProductList.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsView.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> implements HomeTabNavigator {
  HomeTabViewModel viewModel = HomeTabViewModel(
      GetCategoriesUseCase(injectCategoriesRepository()),
      GetNewAddedProductsUseCase(injectProductRepository()),
      AddToWishListUseCase(injectProductRepository()) ,
      DeleteFromWishListUseCase(injectProductRepository())
  );
  @override
  void initState() {
    super.initState();
    viewModel.getCategories();
    viewModel.getNewAddedProducts();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            // if the value of error message is not null then user will be able to try again
            return errorWidget(
                value.errorMessage!, value.onTryAgainButtonPress);
          } else if (value.categories == null || value.products == null) {
            // if there is no error and dat not loaded it will show circular progress indicator
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.darkBlue,
              ),
            );
          } else {
            // this will show the data if loaded
            return  SingleChildScrollView(
              child: Column(
                children: [
                  Row(),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Let’s Start Shopping",
                      style: TextStyle(color: MyTheme.darkBlue),
                    ),
                  ),
                  const Text(
                    "Gaya Store",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.darkBlue),
                  ),
                  const SizedBox(height: 30,),
                  BannerSlideShow(),
                  const SizedBox(height: 20,),
                  CategoriesList(value.categories!),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "New Products",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ],
                  ),
                  HomeProductList(value.products! , value.onWidgetPress , value.onFavoritePress),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void goToProductListScreen(Categories category) {
    Navigator.pushNamed(context, ProductsListScreen.routeName,
        arguments: category);
  }

  @override
  void goToProductDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName , arguments: product);
  }


  @override
  void hideDialog() {
    MyDialogUtils.hideDialog(context: context);
  }

  @override
  void showLoading() {
    MyDialogUtils.showLoading(context: context, message: "Loading .... ");
  }

  @override
  void showSuccessMessage(String message) {
    MyDialogUtils.showSuccessDialog(context: context, message: message);
  }
}
