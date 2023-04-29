import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/Core/Provider/AppConfigProvider.dart';
import 'package:ecommerce/Core/Theme/MyTheme.dart';
import 'package:ecommerce/Domain/Models/Prdouct.dart';
import 'package:ecommerce/Domain/UseCase/GetProductDetailsUseCase.dart';
import 'package:ecommerce/Presentation/UI/Global%20Widgets/errorWidget.dart';
import 'package:ecommerce/Presentation/UI/ProductDetails/ProductDetailsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName =  'product Details Screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsViewModel viewModel = ProductDetailsViewModel(GetProductDetailsUseCase(injectProductRepository()));
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context , listen: false);
    if(viewModel.id == null){
      viewModel.getProductDetails(product.id!.toString(), provider);
    }
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.name!
          ),
        ),
        body: Column(
          children: [
            Consumer<ProductDetailsViewModel>(
              builder: (context, value, child) {
                if(value.errorMessage != null){
                  return errorWidget(value.errorMessage! , value.onTryAgainPress);
                }else if(value.product == null){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.darkBlue,
                    ),
                  );
                }else {
                  return Text(value.product!.description!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
