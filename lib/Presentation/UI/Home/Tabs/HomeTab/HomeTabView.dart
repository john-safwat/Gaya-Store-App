import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetNewAddedProductUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/BannerSlideShow.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductsList/ProductsListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> implements HomeTabNavigator {
  HomeTabViewModel viewModel = HomeTabViewModel(
      GetCategoriesUseCase(injectCategoriesRepository()),
      GetNewAddedProductsUseCase(injectProductRepository()));
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(),
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
                  CategoriesList(value.categories!),
                  BannerSlideShow(),
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
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            color: MyTheme.lightBlue,
                            border: Border.all(
                              width: 2,
                              color: MyTheme.blue,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        child: Column(
                          children: [
                            Expanded(
                                //child: Image.network(value.products![index].mainImage!),
                                child: CachedNetworkImage(
                              imageUrl: value.products![index].mainImage!,
                              imageBuilder: (context, imageProvider) =>
                                  ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  topRight: Radius.circular(13),
                                ),
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: MyTheme.darkBlue,
                              )),
                            )),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 10, left: 15, bottom: 5),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value.products![index].name!,
                                      style: const TextStyle(
                                          color: MyTheme.darkBlue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          initialRating: double.parse(value
                                              .products![index].rating!
                                              .toString()),
                                          minRating: 1,
                                          ignoreGestures: true,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 18,
                                          onRatingUpdate: (rate) {},
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${value.products![index].price} EGP",
                                          style: const TextStyle(
                                              color: MyTheme.darkBlue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              value.products![index]
                                                      .isInWishList =
                                                  !value.products![index]
                                                      .isInWishList!;
                                              setState(() {

                                              });
                                            },
                                            icon: value.products![index]
                                                    .isInWishList!
                                                ? const Icon(
                                                    Icons.favorite_rounded,
                                                    color: MyTheme.darkBlue,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: MyTheme.darkBlue,
                                                  ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: value.products!.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
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
}
