import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabVIew.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabView.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/ProfileTab/ProfileTabView.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/SearchTab/SearchTabView.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/WithLIstTab/WishListTabView.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const HomeTabView(),
    const SearchTabView(),
    const CartTabView(),
    const WishListTabView(),
    const ProfileTabView()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: tabs[selectedIndex]
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: MyTheme.darkBlue,
        ),
        child: SalomonBottomBar(
          unselectedItemColor: MyTheme.lightBlue,
          itemShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          selectedColorOpacity: 0.3,
          currentIndex: selectedIndex,
          onTap: (i) => setState(() => selectedIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: MyTheme.backGround,
            ),

            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: MyTheme.backGround,
            ),

            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              selectedColor: MyTheme.backGround,
            ),

            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite),
              title: const Text("WishList"),
              selectedColor: MyTheme.backGround,
            ),

            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.account_circle),
              title: const Text("Profile"),
              selectedColor: MyTheme.backGround,
            ),
          ],
        ),
      ),
    );
  }
}