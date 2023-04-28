import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductWidget extends StatefulWidget {
  Product product;
  ProductWidget(this.product);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: MyTheme.lightBlue,
          border: Border.all(
            width: 2,
            color: MyTheme.blue,
          ),
          borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(child: CachedNetworkImage(
            imageUrl: widget.product.mainImage!,
            imageBuilder: (context, imageProvider) => ClipRRect(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name!,
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
                        initialRating:
                            double.parse(widget.product.rating!.toString()),
                        minRating: 1,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.product.price} EGP",
                        style: const TextStyle(
                            color: MyTheme.darkBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.isInWishList =
                                  !widget.product.isInWishList!;
                            });
                          },
                          icon: widget.product.isInWishList!
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: MyTheme.darkBlue,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
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
    );
  }
}
