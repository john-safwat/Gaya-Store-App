import 'package:ecommerce/Data/Api/PaymentApi.dart';
import 'package:ecommerce/Data/Models/Payment/Request/OrderRegestration/OrderRegestrationRequestDTO.dart';
import 'package:ecommerce/Data/Models/Payment/Request/PaymentKeyRequest/PaymentKeyRequestDTO.dart';
import 'package:ecommerce/Domain/Repository/Orders_Repository_Contract.dart';

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  PaymentApi paymentApi ;
  PaymentRemoteDataSourceImpl(this.paymentApi);

  @override
  Future<String> authRequest() async{
    var response = await paymentApi.authRequest();
    return response;
  }

  @override
  Future<String> orderRegistrationRequest(OrderRegistrationRequestDTO orderRegistrationRequest) async{
    var response = await paymentApi.orderRegistrationRequest(orderRegistrationRequest);
    return response;
  }

  @override
  Future<String> paymentKeyRequest(PaymentKeyRequestDTO paymentKeyRequestDTO) async{
    var response = await paymentApi.paymentKeyRequest(paymentKeyRequestDTO);
    return response;
  }



}