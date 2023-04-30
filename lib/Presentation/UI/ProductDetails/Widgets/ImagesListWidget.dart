import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:flutter/material.dart';

class ImagesListWidget extends StatelessWidget {
  List<String> images ;
  Function onImagePress;
  
  ImagesListWidget(this.images , this.onImagePress);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            onImagePress(index);
          },
          child: ClipRRect(
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  imageBuilder: (context, imageProvider) =>
                      Image(image: imageProvider),
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
              ),
            ),
          ),
        ),
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
