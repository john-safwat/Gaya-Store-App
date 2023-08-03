import 'package:ecommerce/Domain/Models/Order/Order.dart';
import 'package:ecommerce/Domain/Models/Order/OrderResponse.dart';
import 'package:ecommerce/Domain/Models/Order/OrdersHistory.dart';
import 'package:ecommerce/Domain/Models/Payment/Request/OrderRegestration/Items.dart';
import 'package:ecommerce/Domain/Models/Payment/Request/OrderRegestration/OrderRegestrationRequest.dart';
import 'package:ecommerce/Domain/Models/Payment/Request/PaymentKeyRequest/PaymentKeyRequest.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

import '../../Domain/Models/Payment/Request/PaymentKeyRequest/BillingData.dart';

class OrdersRepositoryImpl implements OrdersRepository{
  OrdersRemoteDataSource remoteDataSource;
  PaymentRemoteDataSource paymentRemoteDataSource;
  OrdersRepositoryImpl (this.remoteDataSource , this.paymentRemoteDataSource);

  @override
  Future<OrderResponse> placeOrder(Order order) async{
    var response = await remoteDataSource.placeOrder(order);
    return response;
  }

  @override
  Future<List<OrdersHistory>?> getOrderHistory(String token) async{
    var response = await remoteDataSource.getOrderHistory(token);
    return response.orders;
  }

  @override
  Future<String> authRequest() async{
    var response = await paymentRemoteDataSource.authRequest();
    return response;
  }

  @override
  Future<String> orderRegistrationRequest({
    required String authToken,
    required int total,
    required List<Items> products , required id}) async{
    total = total * 100;
    var response = await paymentRemoteDataSource.orderRegistrationRequest(
      OrderRegistrationRequest(
        items: [],
        deliveryNeeded: "false",
        currency: "EGP",
        authToken: authToken,
        amountCents: total.toString(),
        merchantOrderId: id,
      ).toDataSource()
    );
    return response;
  }

  @override
  Future<String> paymentKeyRequest({String? authToken ,String? id , required int total}) async{
    total = total * 100;
    var response = await paymentRemoteDataSource.paymentKeyRequest(PaymentKeyRequest(
      authToken: authToken,
      amountCents: total.toString(),
      currency:  "EGP",
      expiration: 3600,
      integrationId:4072452,
      orderId: id,
      billingData: BillingData(
        apartment : "803",
        email : "johnsafwat362@gmail.com",
        floor : "5",
        firstName : "John",
        street : "Ahmed ragabstreet",
        building : "27",
        phoneNumber : "+20 1204984211",
        shippingMethod : "PKG",
        postalCode : "12334",
        city : "Cairo",
        country : "EG",
        lastName : "Safwat",
        state : "cairo"
      )
    ).toDomain());
    return response;
  }

}