import 'package:ecommerce/Core/Base/Base_State.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetWishListProductsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/PoductShowWidget.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListTabView extends StatefulWidget {
  const WishListTabView({Key? key}) : super(key: key);

  @override
  State<WishListTabView> createState() => _WishListTabViewState();
}

class _WishListTabViewState extends BaseState<WishListTabView , WishListTabViewModel>
    implements WishListTabNavigator {

  @override
  WishListTabViewModel initViewModel() {
    return WishListTabViewModel(
      GetWishListProductsUseCase(injectProductRepository()),
      DeleteFromWishListUseCase(injectProductRepository()),
      AddToWishListUseCase(injectProductRepository()),
    );
  }
  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<WishListTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            return errorWidget(value.errorMessage!, value.onTryAgainPress);
          } else if (value.products == null || value.products!.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/empty-box.png',
                width: 120,
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                    itemCount: value.products!.length,
                    itemBuilder: (context, index) => ProductShowWidget(
                      value.products![index],
                      value.onViewNowPress,
                      value.onSlidablePress
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void goToProductDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }
}
