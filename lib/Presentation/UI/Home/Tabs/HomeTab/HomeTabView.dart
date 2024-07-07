import 'package:ecommerce/Core/Base/BaseState.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Categories/Categories.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetNewAddedProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/ProductWidget.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/BannerSlideShow.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/Categories.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsView.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends BaseState<HomeTabView , HomeTabViewModel> implements HomeTabNavigator {

  @override
  HomeTabViewModel initViewModel() {
    return HomeTabViewModel(
        GetCategoriesUseCase(injectCategoriesRepository()),
        GetNewAddedProductsUseCase(injectProductRepository()),
        AddToWishListUseCase(injectProductRepository()) ,
        DeleteFromWishListUseCase(injectProductRepository())
    );
  }

  @override
  void initState() {
    super.initState();
    viewModel.getCategories();
    viewModel.getNewAddedProducts();
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0 ,horizontal: 15),
                        child: Text(
                          "Categories",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  CategoriesList(value.categories!),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "New Products",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    physics:const BouncingScrollPhysics(),
                    children: value.products!.map((e) => ProductWidget(e , value.onWidgetPress , value.onFavoritePress)).toList(),
                  )
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

}
