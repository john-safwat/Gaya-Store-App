import 'package:ecommerce/Core/Base/Base_State.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/SearchForProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/PoductShowWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/SearchTab/SearchTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/SearchTab/SearchTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class SearchTabView extends StatefulWidget {
  const SearchTabView({Key? key}) : super(key: key);

  @override
  State<SearchTabView> createState() => _SearchTabViewState();
}

class _SearchTabViewState extends BaseState<SearchTabView , SearchTabViewModel>
    implements SearchTabNavigator {

  final controller = ScrollController();
  @override
  SearchTabViewModel initViewModel() {
    return SearchTabViewModel(
        SearchForProductUseCase(injectProductRepository()),
        AddToWishListUseCase(injectProductRepository()),
        DeleteFromWishListUseCase(injectProductRepository()));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(15)),
              child: ScrollAppBar(
                controller: controller,
                backgroundColor: Colors.transparent,
                toolbarHeight: 80,
                title: TextFormField(
                  style: const TextStyle(
                    color: MyTheme.darkBlue,
                    fontSize: 18,
                  ),
                  cursorColor: MyTheme.darkBlue,
                  onChanged: (query) {
                    viewModel.getProducts(query);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: MyTheme.darkBlue,
                    ),
                    fillColor: MyTheme.backGround,
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: MyTheme.darkBlue,
                      fontSize: 18,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: MyTheme.lightBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: MyTheme.lightBlue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: MyTheme.lightBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: MyTheme.lightBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Consumer<SearchTabViewModel>(
              builder: (context, value, child) {
                if (value.errorMessage != null) {
                  return Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/no-connection.png',
                        width: 100,
                      ),
                    ),
                  );
                } else if (value.products == null) {
                  return Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/scan.png',
                        width: 100,
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ProductShowWidget(
                            value.products![index],
                            value.onViewNowPress,
                            value.onSlidablePress),
                        itemCount: value.products!.length,
                        controller: controller,
                        physics: const AlwaysScrollableScrollPhysics(),
                      )
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
  void goToDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

}
