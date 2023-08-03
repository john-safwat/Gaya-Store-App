import 'package:ecommerce/Domain/Exception/PaymentException.dart';
import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderProducts.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Models/Payment/Request/OrderRegestration/Items.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class PlaceOrderUseCaseDTO {
  OrdersRepository repository;
  PlaceOrderUseCaseDTO(this.repository);

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
    try{
      var orderResponse = await repository.placeOrder(Order(
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
      ));
      var authResponse = await repository.authRequest();
      var orderRegistrationResponse = await repository.orderRegistrationRequest(
        authToken: authResponse,
        products: products.map((e) => Items(id: e.id , orderTotal: e.orderTotal , quantity: e.quantity)).toList(),
        total: orderResponse.total!,
        id: orderResponse.orderNumber.toString(),
      );
      print(orderResponse);
      print(orderRegistrationResponse);
      var paymentKeyResponse = await repository.paymentKeyRequest(authToken: authResponse , id: orderRegistrationResponse ,total: orderResponse.total!);
      return orderResponse;
    }catch(e){
      throw PaymentException("Operation Error");
    }
  }
}
