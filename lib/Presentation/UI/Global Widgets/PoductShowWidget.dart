import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductShowWidget extends StatelessWidget {
  Product product;
  Function onViewNowPress;
  Function onSlidablePress;
  ProductShowWidget(this.product , this.onViewNowPress , this.onSlidablePress);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
        decoration: BoxDecoration(
            color: MyTheme.lightBlue,
            borderRadius: BorderRadius.circular(15)
        ),
        height: 170,
        child: Slidable(
          key: const ValueKey(1),
          endActionPane: ActionPane(
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                backgroundColor:product.isInWishList! ? Colors.red : MyTheme.blue,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20) ,bottomRight: Radius.circular(20)),
                flex: 2,
                autoClose: true,
                label: product.isInWishList!?"Delete" : "Add",
                icon: product.isInWishList!?Icons.delete :Icons.add,
                onPressed: (context) {
                  onSlidablePress(product);
                  product.isInWishList = !product.isInWishList!;
                },
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: CachedNetworkImage(
                    imageUrl: product.mainImage!,
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(image: imageProvider , fit: BoxFit.cover , height: double.infinity,),
                    ),
                    placeholder: (context, url) =>const Center(
                      child: CircularProgressIndicator(
                        color: MyTheme.darkBlue,
                      ),
                    ),
                    errorWidget: (context, url, error) =>const Icon(Icons.error ,color: Colors.red, ),
                  )
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name!,
                          style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBlue,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating:
                              double.parse(product.rating!.toString()),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '${product.price!} EGP',
                            style:const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.darkBlue
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            onViewNowPress(product);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              )
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              Text(
                                "View Now",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
