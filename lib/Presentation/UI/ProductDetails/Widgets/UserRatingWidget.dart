import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserRatingWidget extends StatelessWidget {
  String? rating;
  UserRatingWidget(this.rating);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.builder(
            initialRating: rating == null ? 0 :double.parse(rating!),
            minRating: 1,
            ignoreGestures: rating != null ,
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
    );
  }
}
