import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/FeedBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBacksWidget extends StatelessWidget {
  double rating;
  List<FeedBack>? feedbacks ;
  FeedBacksWidget(this.rating , this.feedbacks);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              initialRating:rating,
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
          children: feedbacks != null
              ? feedbacks!.map(
                  (e) => Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                decoration: BoxDecoration(
                    color: MyTheme.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,

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
    );
  }
}
