import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class BrandAndRatingWidget extends StatelessWidget {
  String brand ;
  String rating;

  BrandAndRatingWidget(this.brand , this.rating);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          Text(
            brand,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Text(
                rating,
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
    );
  }
}
