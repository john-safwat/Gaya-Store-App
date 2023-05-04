import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Cart/CartProduct.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  int productIndex;
  Function onSlibablePress;
  Function onPlusButtonPress;
  Function onMinusButtonPress;

  CartItemWidget(this.productIndex, this.onPlusButtonPress,
      this.onMinusButtonPress, this.onSlibablePress);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    CartTabViewModel viewModel = Provider.of<CartTabViewModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: MyTheme.lightBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      height:170,
      child: Slidable(
        endActionPane: ActionPane(
          key:const ValueKey(1),
          extentRatio: 0.3,
          motion:const ScrollMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20) ,bottomRight: Radius.circular(20)),
              flex: 2,
              autoClose: true,
              label: "Delete" ,
              icon: Icons.delete ,
              onPressed: (context) {
                widget.onSlibablePress(viewModel.products![widget.productIndex].productId.toString());
              },
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: viewModel
                    .products![widget.productIndex].cartProduct!.mainImage!,
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
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel
                            .products![widget.productIndex].cartProduct!.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: MyTheme.darkBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: double.parse(viewModel
                                .products![widget.productIndex]
                                .cartProduct!
                                .rating!
                                .toString()),
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${viewModel.products![widget.productIndex].cartProduct!.price!.toString()} EGP',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: MyTheme.darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: MyTheme.darkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                onTap: () {
                                  viewModel.products![widget.productIndex]
                                          .cartProduct!.orderedQuantity =
                                      widget.onMinusButtonPress(viewModel
                                          .products![widget.productIndex]
                                          .cartProduct!
                                          .orderedQuantity!);

                                  setState(() {});
                                  },
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                            )),
                            Expanded(
                                child: Text(
                              viewModel.products![widget.productIndex]
                                  .cartProduct!.orderedQuantity!
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            )),
                            Expanded(
                                child: InkWell(
                                onTap: () {
                                  viewModel.products![widget.productIndex]
                                          .cartProduct!.orderedQuantity =
                                      widget.onPlusButtonPress(
                                          int.parse(viewModel
                                              .products![widget.productIndex]
                                              .cartProduct!
                                              .quantity!
                                              .toString()),
                                          viewModel.products![widget.productIndex]
                                              .cartProduct!.orderedQuantity!);
                                  setState(() {});
                                },
                                child: const Text(
                                '+',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
