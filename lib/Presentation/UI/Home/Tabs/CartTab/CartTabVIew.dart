import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/GetCartItemsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class CartTabView extends StatefulWidget {
  const CartTabView({Key? key}) : super(key: key);

  @override
  State<CartTabView> createState() => _CartTabViewState();
}

class _CartTabViewState extends State<CartTabView> implements CartTabNavigator {
  CartTabViewModel viewModel =
      CartTabViewModel(GetCartItemsUseCase(injectProductRepository()));
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
    if (viewModel.provider == null) {
      AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
      viewModel.getCartItems(provider);
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CartTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            return errorWidget(value.errorMessage!, value.onTryAgainPress);
          } else if (value.products == null) {
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
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: MyTheme.lightBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 200,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                              imageUrl: value.products![index].cartProduct!.mainImage!,
                              imageBuilder: (context, imageProvider) => ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                ),
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
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding:const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.products![index].cartProduct!.name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(
                                      color: MyTheme.darkBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating:
                                        double.parse(value.products![index].cartProduct!.rating!.toString()),
                                        minRating: 1,
                                        ignoreGestures: true,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 22,
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
                                  const SizedBox(height: 5,),
                                  Text(
                                    '${value.products![index].cartProduct!.price!.toString()} EGP',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:const TextStyle(
                                      color: MyTheme.darkBlue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: MyTheme.darkBlue,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){},
                                            child:const Text("-",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold ,
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),

                                          )
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){},
                                            child:const Text("1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold ,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: (){},
                                            child:const Text('+',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold ,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    itemCount: value.products!.length
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
