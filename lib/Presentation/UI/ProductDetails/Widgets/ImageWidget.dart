import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String image;
  ImageWidget(this.image);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.contain,
      width: double.infinity,
      height: 300,
      imageBuilder: (context, imageProvider) =>
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2 , color: Theme.of(context).primaryColor)
            ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                  child: Image(image: imageProvider , fit: BoxFit.cover,)
              )
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
    );
  }
}
