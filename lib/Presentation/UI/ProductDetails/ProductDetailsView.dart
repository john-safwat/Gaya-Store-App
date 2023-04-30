import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsViewModel.dart';
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
                      Text(
                        value.product!.name!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBlue),
                      ),
                      // brand and rating
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            Text(
                              value.product!.brand!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                Text(
                                  value.product!.rating!.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: MyTheme.darkBlue),
                                ),
                                const Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // images
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: value.image,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // list view
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              value.onImagePress(index);
                            },
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: value.product!.images![index],
                                    imageBuilder: (context, imageProvider) =>
                                        Image(image: imageProvider),
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        color: MyTheme.darkBlue,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: value.product!.images!.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // the description text
                      Text(
                        value.product!.description!,
                        style: const TextStyle(
                          color: MyTheme.darkBlue,
                          fontSize: 16,
                        ),
                      ),
                      // price
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          "Price : ${value.product!.price!} EGP",
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.darkBlue),
                        ),
                      ),
                      // the buttons
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(MyTheme.darkBlue),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Add To Cart",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.add_shopping_cart,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: MyTheme.darkBlue),
                              child: product.isInWishList!
                                  ? const Icon(Icons.favorite_rounded , size: 30,color: MyTheme.backGround,)
                                  : const Icon(Icons.favorite_border_rounded , size:30, color: MyTheme.backGround,),
                            ),
                          ),
                          //
                        ],
                      ),
                      // description Image
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),

                        child: CachedNetworkImage(
                          imageUrl: value.product!.descriptionImage!,
                          imageBuilder: (context, imageProvider) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(image: imageProvider),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: MyTheme.darkBlue,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // feedBacks
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                            Text(
                              "FeedBack & Reviews",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: MyTheme.darkBlue
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            initialRating:
                            double.parse(value.product!.rating!.toString()),
                            minRating: 1,
                            ignoreGestures: true,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30,
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
                      const SizedBox(height: 20,),
                      Column(
                        children: value.product!.feedBack != null
                          ? value.product!.feedBack!.map(
                              (e) => Container(
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                                decoration: BoxDecoration(
                                  color: MyTheme.lightBlue,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,

                                    )
                                  ]
                                ),                                
                                child: Column(
                                  children: [
                                    // name and image
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(e.userImage!),
                                        ),
                                        const SizedBox(width: 15,),
                                        Text(
                                          e.user!,
                                          style:const TextStyle(
                                            fontSize: 18,
                                            color: MyTheme.darkBlue,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                    // the comment
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 15),
                                          child: Text(
                                            e.comment!,
                                            style:const TextStyle(
                                              fontSize: 18,
                                              color: MyTheme.darkBlue
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // the rating
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          initialRating:
                                          double.parse(e.rate!.toString()),
                                          minRating: 1,
                                          ignoreGestures: true,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
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
                                  ],
                                ),
                              )
                        ).toList()
                          :[],
                      ),
                      const SizedBox(height: 20,),
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
