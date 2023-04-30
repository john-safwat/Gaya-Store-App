import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsViewModel.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/BrandAndRatingWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ButtonsWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/DescriptionImageWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/FeedBacksWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ImageWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/ImagesListWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/NameWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/DescriptionWIdget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/Widgets/PriceWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product Details Screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsViewModel viewModel = ProductDetailsViewModel(
      GetProductDetailsUseCase(injectProductRepository()));

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    AppConfigProvider provider =
        Provider.of<AppConfigProvider>(context, listen: false);
    if (viewModel.id == null) {
      viewModel.getProductDetails(product.id!.toString(), provider);
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.name!),
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
                      ButtonsWidget(product.isInWishList!),
                      // description Image
                      DescriptionImageWidget(value.product!.descriptionImage!),
                      // feedBacks
                      FeedBacksWidget(double.parse(value.product!.rating!.toString()), value.product!.feedBack),
                      // your rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          Text("Your Rating", style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBlue
                          ),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: value.product!.userRating ==null ? 0 :double.parse(value.product!.userRating.toString()),
                              minRating: 1,
                              ignoreGestures: value.product!.userRating !=null ,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 35,
                              onRatingUpdate: (rate) {},
                              itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Opinion",
                          fillColor: MyTheme.lightBlue,
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
