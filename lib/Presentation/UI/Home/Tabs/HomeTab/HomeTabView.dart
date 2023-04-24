import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/GetCategoriesUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/HomeTab/HomeTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Widgets/CategoryShowWidget.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel viewModel =
      HomeTabViewModel(GetCategoriesUseCase(injectCategoriesRepository()));
  @override
  void initState() {
    super.initState();
    viewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<HomeTabViewModel>(
        builder: (context, value, child) {
          if (value.categories == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.darkBlue,
              ),
            );
          } else {
            return Column(
              children: [
                Row(),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Let’s Start Shopping",
                    style: TextStyle(color: MyTheme.darkBlue),
                  ),
                ),
                const Text(
                  "Gaya Store",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.darkBlue),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryShowWidget(
                            image: value.categories![index].image!,
                            name: value.categories![index].name!),
                        itemCount: value.categories!.length,
                      ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
