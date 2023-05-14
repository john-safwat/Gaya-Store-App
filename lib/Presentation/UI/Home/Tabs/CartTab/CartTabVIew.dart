import 'package:ecommerce/Core/Base/Base_State.dart';
import 'package:ecommerce/Core/Base/Base_View_Model.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/UseCase/DeleteProductFromCartUseCase.dart';
import 'package:ecommerce/Domain/UseCase/GetCartItemsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabNavigator.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/CartTabViewModel.dart';
import 'package:ecommerce/Presentation/UI/Home/Tabs/CartTab/Widgets/CartItemWidget.dart';
import 'package:ecommerce/Presentation/UI/Payment/PaymentView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/Utils/Dialog_Utils.dart';

class CartTabView extends StatefulWidget {
  const CartTabView({Key? key}) : super(key: key);

  @override
  State<CartTabView> createState() => _CartTabViewState();
}

class _CartTabViewState extends BaseState<CartTabView , CartTabViewModel> implements CartTabNavigator {


  @override
  CartTabViewModel initViewModel() {
    return CartTabViewModel(GetCartItemsUseCase(injectProductRepository()),
        DeleteProductFromCartUseCase(injectProductRepository()));
  }

  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<AppConfigProvider>(context,listen: false);
    viewModel.getCartItems();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.provider = null ;
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CartTabViewModel>(
        builder: (context, value, child) {
          if (value.errorMessage != null) {
            return errorWidget(value.errorMessage!, value.onTryAgainPress);
          } else if (value.products == null || value.products!.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/empty-box.png',
                width: 120,
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CartItemWidget(
                      index,
                      value.onPlusButtonPress,
                      value.onMinusButtonPress,
                      value.onSlidablePress),
                    itemCount: value.products!.length
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",style: TextStyle(fontSize: 18 , color: MyTheme.darkBlue),),
                      Text("${value.calcTotal()} EGP",style:const  TextStyle(
                        fontSize: 18 ,
                        color: MyTheme.darkBlue,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
                Container(
                  color: MyTheme.darkBlue,
                  width: double.infinity,
                  height: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBlue)
                    ),
                    onPressed: (){
                      value.onGoToPaymentPress();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Go To Payment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void goToPaymentScreen(List<OrderProducts> orderProducts) {
    Navigator.pushNamed(context, PaymentScreen.routeName , arguments: orderProducts);
  }
}
