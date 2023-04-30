import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String image;
  ImageWidget(this.image);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        imageUrl: image,
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
    );
  }
}
