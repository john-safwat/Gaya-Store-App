import 'package:ecommerce/Core/Base/BaseState.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Products/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/AddProductToCartUseCase.dart';
import 'package:ecommerce/Domain/UseCase/AddToWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/DeleteFromWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsNavigator.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsViewModel.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/BrandAndRatingWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ButtonsWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/DescriptionImageWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/DescriptionWIdget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/FeedBacksWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ImageWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ImagesListWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/NameWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/PriceWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/UserRatingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product Details Screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends BaseState<ProductDetailsScreen ,ProductDetailsViewModel > implements ProductDetailsNavigator{

  @override
  ProductDetailsViewModel initViewModel() {
    return ProductDetailsViewModel(
      GetProductDetailsUseCase(injectProductRepository()),
      AddToWishListUseCase(injectProductRepository()),
      DeleteFromWishListUseCase(injectProductRepository()),
      AddProductToCartUseCase(injectProductRepository()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.id == null) {
      Product product = ModalRoute.of(context)?.settings.arguments as Product;
      viewModel.id = product.id!.toString() ;
      viewModel.abstractProduct = product;
      viewModel.getProductDetails();
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(viewModel.abstractProduct!.name!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<ProductDetailsViewModel>(
            builder: (context, value, child) {
              if (value.errorMessage != null) {
                return errorWidget(value.errorMessage!, value.onTryAgainPress);
              } else if (value.product == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.darkBlue,
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // product name
                      NameWidget(value.product!.name!),
                      // brand and rating
                      BrandAndRatingWidget(value.product!.brand!,value.product!.rating!.toString()),
                      // images
                      ImageWidget(value.image),
                      // list view
                      const SizedBox(
                        height: 10,
                      ),
                      ImagesListWidget(value.product!.images!, value.onImagePress),
                      const SizedBox(
                        height: 10,
                      ),
                      // the description text
                      DescriptionWidget(value.product!.description!),
                      // price
                      PriceWidget(value.product!.price!.toString()),
                      // the buttons
                      ButtonsWidget(value.onAddToCartPress),
                      // description Image
                      DescriptionImageWidget(value.product!.descriptionImage!),
                      // feedBacks
                      FeedBacksWidget(double.parse(value.product!.rating!.toString()), value.product!.feedBack),
                      // user rating
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your Rating", style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBlue
                          ),),
                        ],
                      ),
                      UserRatingWidget(value.product!.userRating == null? null : value.product!.userRating!.toString()),
                      Form(
                        child: Column(
                          children: [
                            Container(
                              margin:const EdgeInsets.all(10),
                              child:value.product!.userComment == null ? TextFormField(
                                maxLines: 6,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Opinion",
                                  fillColor: MyTheme.lightBlue,
                                  filled: true,
                                  hintStyle: TextStyle(
                                    fontSize: 18 ,
                                    color: MyTheme.darkBlue.withOpacity(0.7),
                                  ),
                                  contentPadding:const EdgeInsets.all(20),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:const BorderSide(width: 2, color: MyTheme.darkBlue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(width: 2, color: Colors.red),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  disabledBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(width: 2, color: MyTheme.darkBlue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(width: 2, color: MyTheme.darkBlue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder:  OutlineInputBorder(
                                    borderSide:const BorderSide(width: 2, color: MyTheme.darkBlue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ):Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(40),
                                    decoration: BoxDecoration(
                                        color: MyTheme.lightBlue,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 5,
                                          )
                                        ]
                                    ),
                                    child: Text(
                                      value.product!.userComment!,
                                      style:const TextStyle(
                                          fontSize: 22,
                                          color: MyTheme.darkBlue
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: (){

                                    },
                                    icon:const Icon(Icons.edit, color: MyTheme.darkBlue,),
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: (){},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ))
                                      ),
                                      child:const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                        )
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
