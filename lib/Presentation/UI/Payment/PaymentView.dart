import 'package:ecommerce/Core/Base/Base_State.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Core/Utils/Dialog_Utils.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/UseCase/PlaceOrderUseCase.dart';
import 'package:ecommerce/Presentation/UI/Home/HomeScreenView.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentNavigator.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentViewModel.dart';
import 'package:ecommerce/Presentation/UI/Payment/Tabs/CridetCardTab.dart';
import 'package:ecommerce/Presentation/UI/Payment/Tabs/ReceiptTab.dart';
import 'package:ecommerce/Presentation/UI/Payment/Tabs/UserInfoTab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = 'Payment Screen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends BaseState<PaymentScreen , PaymentViewModel> implements PaymentNavigator {
  List<Widget> tabs = [UserInfoTab() , CreditCardTab() , ReceiptTab()];
  List<String> titles = ["Shipping Information" , "Card Information" , "Receipt"];

  @override
  PaymentViewModel initViewModel() {
    return PaymentViewModel(PlaceOrderUseCaseDTO(injectOrdersRepository()));
  }
  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<AppConfigProvider>(context , listen: false);
  }
  @override
  void dispose() {
    super.dispose();
    viewModel.provider = null;
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.products == null){
      var products = ModalRoute.of(context)?.settings.arguments as List<OrderProducts>;
      viewModel.products = products;
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<PaymentViewModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                viewModel.onBackPress();
              },
              icon: const Icon(Icons.arrow_back_ios , color: MyTheme.darkBlue,)
            ),
            title: Text(titles[viewModel.selectedIndex] , style:const TextStyle(color: MyTheme.darkBlue),),
          ),
          body:tabs[value.selectedIndex],
        ),
      ),
    );
  }

  @override
  void goToHomeScreenCartTab() {
    Navigator.pop(context);
  }

  @override
  void goToHomeScreenHomeTab() {
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, HomeScreen.routeName);
  }
}