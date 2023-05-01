import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductWidget extends StatefulWidget {
  Product product ;
  Function onWidgetPress;
  Function onFavoritePress;

  ProductWidget(this.product , this.onWidgetPress , this.onFavoritePress);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
      decoration: BoxDecoration(
          color: MyTheme.lightBlue,
          border: Border.all(
            width: 2,
            color: MyTheme.blue,
          ),
          borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: (){
          widget.onWidgetPress(widget.product);
        },
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
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.product.price} EGP",
                          style: const TextStyle(
                              color: MyTheme.darkBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                            onTap: () {
                              widget.onFavoritePress(widget.product);
                              setState(() {
                                widget.product.isInWishList = !widget.product.isInWishList!;
                              });
                            },
                            child: widget.product.isInWishList!
                                ? const Icon(
                                    Icons.favorite_rounded,
                                    color: MyTheme.blue,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    color: MyTheme.blue,
                                    size: 30,
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
    );
  }
}
