import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/Base/BaseState.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/DeleteWishListUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetUserDataUseCase.dart';
import 'package:ecommerce/Presentation/UI/EditUserInfo/EditUserInfoView.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/ProfileTab/ProfileTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/ProfileTab/ProfileTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Login/LoginScreenView.dart';
import 'package:ecommerce/Presentation/UI/OrderHistory/OrderHistoryView.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends BaseState<ProfileTabView , ProfileTabViewModel> implements ProfileTabNavigator{

  @override
  ProfileTabViewModel initViewModel() {
    return ProfileTabViewModel(GetUserDataUseCase(injectUserRepository()), DeleteWishListUseCase(injectProductRepository()));
  }

  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<AppConfigProvider>(context , listen: false);
    viewModel.getData();

  }
  @override
  void dispose() {
    super.dispose();
    viewModel.provider = null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ProfileTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            return errorWidget(value.errorMessage!, value.onTryAgainPress);
          } else if (value.userData == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.darkBlue,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // the image and user name
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          value.userData!.image == null
                              ? Container(color: Theme.of(context).primaryColor, height: 250,)
                              : CachedNetworkImage(
                                  imageUrl: value.userData!.image!,
                                  imageBuilder: (context, imageProvider) => Image(
                                    image: imageProvider,
                                    height: 300,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ).blurred(blur: 2, blurColor: MyTheme.darkBlue),
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: MyTheme.darkBlue,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                          Positioned(
                              child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: MyTheme.backGround,
                              boxShadow: [
                                BoxShadow(
                                  color: MyTheme.lightBlue.withOpacity(0.5),
                                  blurRadius: 30,
                                  offset: const Offset(0, -30),
                                )
                              ],
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(100)),
                            ),
                          ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            value.userData!.image == null
                                ? CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                                    child: Lottie.asset("assets/animations/noImage.json"))
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        NetworkImage(value.userData!.image!),
                                  ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(
                                      value.userData!.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: MyTheme.darkBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(
                                      value.userData!.email!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Color(0xFF97A1A3),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // the buttons
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Account",
                          style: TextStyle(
                              color: MyTheme.darkBlue,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                value.onPersonalDetailsPress();
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      MyTheme.lightBlue),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: MyTheme.darkBlue,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Personal Details",
                                      style: TextStyle(
                                          color: MyTheme.darkBlue, fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                viewModel.onOrderHistoryPress();
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      MyTheme.lightBlue),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_mall_outlined,
                                      color: MyTheme.darkBlue,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Order History",
                                      style: TextStyle(
                                          color: MyTheme.darkBlue, fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                value.onLogoutPress();
                              },
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      MyTheme.lightBlue),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 20),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void goToOrderHistory() {
    Navigator.pushNamed(context, OrderHistoryScreen.routeName);
  }

  @override
  void goToEditUserInfo() {
    Navigator.pushNamed(context, EditUserInfoScreen.routeName , arguments: viewModel.userData!);
  }

  @override
  void goToLoginScreen() {
    Navigator.popAndPushNamed(context, LoginScreen.routeName);
  }

}
