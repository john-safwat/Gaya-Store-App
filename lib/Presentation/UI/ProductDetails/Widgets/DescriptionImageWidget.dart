import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class DescriptionImageWidget extends StatelessWidget {
  String image;

  DescriptionImageWidget(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),

      child: CachedNetworkImage(
        imageUrl: image,
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
    );
  }
}
