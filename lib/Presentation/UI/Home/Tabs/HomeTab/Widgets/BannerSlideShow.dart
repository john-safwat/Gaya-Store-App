import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Categories.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/BannerWiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BannerSlideShow extends StatelessWidget {

  List<BannerData> bannersData = [
    BannerData(
      1,
      Alignment.topLeft,
      "Shop the Latest Devices and Enjoy the Development",
      'assets/images/productimage1.jpg',
      "View Now",
      MyTheme.darkBlue,
      Categories(id: 18, name: "Electronics"),
    ),
    BannerData(
      2,
      Alignment.topRight,
      "We Just Added New Products",
      'assets/images/productimage2.jpg',
      "Buy Now",
      MyTheme.backGround,
      Categories(id: 3, name: "Beauty and Personal Care")),
    BannerData(
      3,
      Alignment.topLeft,
      "Computers are the Fire of the 21's Century",
      'assets/images/productimage3.jpg',
      "Let's Go",
      MyTheme.darkBlue,
      Categories(id: 19, name: "Computers"))
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 220,
      initialPage: 0,
      indicatorColor: MyTheme.blue,
      indicatorBackgroundColor: MyTheme.backGround,
      isLoop: true,
      children: [
        BannerWidget(bannersData[0]),
        BannerWidget(bannersData[1]),
        BannerWidget(bannersData[2]),
      ],
    );
  }
}

class BannerData {
  int id;
  AlignmentGeometry alignmentGeometry;
  String title;
  String titleOnButton;
  String image;
  Color textColor;
  Categories categories;
  BannerData(this.id, this.alignmentGeometry, this.title, this.image,
      this.titleOnButton, this.textColor, this.categories);
}
