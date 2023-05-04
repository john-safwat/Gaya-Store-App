import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class PlaceOrderUseCase {
  OrdersRepository repository;
  PlaceOrderUseCase(this.repository);

  Future<OrderResponse> invoke(
      String? token,
      String? name,
      String? phoneNumber,
      String? address,
      String? cardNumber,
      String? shippingState,
      String? postalCode,
      double? total,
      List<OrderProducts>? products) async {

    double shippingPriceCount = 0 ;
    for(int i = 0 ; i< products!.length ; i++){
      shippingPriceCount += products[i].quantity!.toDouble() * 10;
    }

    Order order = Order(
      total: total,
      token: token,
      shippingState: shippingState,
      postalCode: postalCode,
      phoneNumber: phoneNumber,
      cardNumber: cardNumber,
      address: address,
      products: products,
      shippingPrice: shippingPriceCount,
      name: name
    );

    var response = await repository.placeOrder(order);
    return response;
  }
}
