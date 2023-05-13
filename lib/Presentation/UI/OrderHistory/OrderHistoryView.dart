import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/UseCase/GetOrdersHistoryUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/OrderHistory/OrderHistoryViewModel.dart';
import 'package:ecommerce/Presentation/UI/OrderHistory/Widgets/OrdersCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);
  static const String routeName  = 'orderHistory';
  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>{
  OrderHistoryViewModel viewModel = OrderHistoryViewModel(GetOrdersHistoryUseCase(injectOrdersRepository()));

  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<AppConfigProvider>(context , listen: false);
    viewModel.getData();


  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(title:const Text("Order History"),),
        body: Consumer<OrderHistoryViewModel>(
          builder: (context, value, child) {
            if(value.errorMessage != null){
              return errorWidget(value.errorMessage!, value.onTryAgainPress);
            }else if(value.orders == null){
              return const Center(
                child: CircularProgressIndicator(
                  color: MyTheme.darkBlue,
                ),
              );
            }else if (viewModel.orders!.length == 0){
              return Center(
                child: Image.asset(
                  'assets/images/empty-box.png',
                  width: 120,
                ),
              );
            }else {
              return SingleChildScrollView(
                child: Column(
                  children: value.orders!.map((e) => OrderCardWidget(e)).toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
