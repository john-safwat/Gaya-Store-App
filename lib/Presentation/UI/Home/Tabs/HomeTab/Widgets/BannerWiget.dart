import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/Widgets/BannerSlideShow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerWidget extends StatelessWidget {
  BannerData bannerData ;
  BannerWidget(this.bannerData);
  @override
  Widget build(BuildContext context) {
    HomeTabViewModel viewModel = Provider.of<HomeTabViewModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        alignment: bannerData.alignmentGeometry,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              bannerData.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal:25 , vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: bannerData.alignmentGeometry==Alignment.topLeft?CrossAxisAlignment.start : CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(bannerData.title,
                  style: TextStyle(
                    color: bannerData.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: bannerData.alignmentGeometry==Alignment.topLeft?TextAlign.start:TextAlign.end,
                ),
                Text(bannerData.categories.name!,
                  style: TextStyle(
                    color: bannerData.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: bannerData.alignmentGeometry==Alignment.topLeft?TextAlign.start:TextAlign.end,
                ),
                ElevatedButton(
                  onPressed: (){
                    viewModel.goToProductsListScreen(bannerData.categories);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(bannerData.textColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      bannerData.titleOnButton,
                      style: TextStyle(
                        fontSize: 18,
                        color: bannerData.textColor ==MyTheme.darkBlue ?MyTheme.backGround:MyTheme.darkBlue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

